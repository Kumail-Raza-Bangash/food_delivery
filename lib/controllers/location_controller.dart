import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/data/api/api_checker.dart';
import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/places.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  bool _loading = false;
  late Position _position;
  late Position _pickPosition;
  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();
  List<AddressModel> _addressList = [];
  late List<AddressModel> _allAddressList;
  List<String> _addressTypeList = ["home", "office", "others"];
  int _addressTypeIndex = 0;
  late Map<String, dynamic> _getAddress;
  bool _updateAddressData = true;
  bool _changeAddress = true;
  late GoogleMapController _mapController;
  bool _isLoading = false;
  bool _inZone = false;
  bool _buttonDisabled = true;

  List<AddressModel> get addressList => _addressList;
  Map get getAddress => _getAddress;
  bool get loading => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;
  Placemark get placemark => _placemark;
  Placemark get pickPlacemark => _pickPlacemark;
  List<String> get addressTypeList => _addressTypeList;
  int get addressTypeIndex => _addressTypeIndex;
  GoogleMapController get mapController => _mapController;
  List<AddressModel> get allAddressList => _allAddressList;
  bool get isLoading => _isLoading;
  bool get inZone => _inZone;
  bool get buttonDisabled => _buttonDisabled;

  //SAVE THE GOOGLE MAP SUGGESTION FOR ADDRESS//
  List<Prediction> _predictionList = [];
  Future<void> getCurrentLocation(bool fromAddress,
      {required GoogleMapController mapController,
      LatLng? defaultLatLng,
      bool notify = true}) async {
    _loading = true;
    if (notify) {
      update();
    }

    AddressModel _addressModel;
    late Position _myPosition;
    Position _test;

    //Position newLocalData = await Geolocator.getCurrentPosition();
    //_myPosition = newLocalData;

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async {
      _myPosition = position;

      if (fromAddress) {
        _position = _myPosition;
      } else {
        _pickPosition = _myPosition;
      }
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_myPosition.latitude, _myPosition.longitude),
        ),
      ));

      Placemark _myPlaceMark;
      try {
        if (!GetPlatform.isWeb) {
          List<Placemark> placeMarks = await placemarkFromCoordinates(
              _myPosition.latitude, _myPosition.longitude);
          _myPlaceMark = placeMarks.first;
        } else {
          String _address = await getAddressfromGeocode(
              LatLng(_myPosition.latitude, _myPosition.longitude));
          _myPlaceMark =
              Placemark(name: _address, locality: '', postalCode: '');
        }
      } catch (e) {
        String _address = await getAddressfromGeocode(
            LatLng(_myPosition.latitude, _myPosition.longitude));
        _myPlaceMark = Placemark(
            name: _address, locality: '', postalCode: '', country: '');
      }

      fromAddress ? _placemark = _myPlaceMark : _pickPlacemark = _myPlaceMark;
      //ResponseModel _responseModel = await getZone(_myPosition.latitude.toString(), _myPosition.longitude.toString(), true);
      //_buttonDisabled = !_responseModel.isSuccess;
      _addressModel = AddressModel(
        latitude: _myPosition.latitude.toString(),
        longitude: _myPosition.longitude.toString(),
        addressType: '${_myPlaceMark.name ?? ''}',
        //'${_myPlaceMark.locality ?? ''}',
        //'${_myPlaceMark.postalCode ?? ''}',
        //'${_myPlaceMark.country ?? ''}',
      );

      _loading = false;
      update();

      print("ha" + _myPosition.toString());
    }).catchError((e) {
      _myPosition = Position(
        longitude: defaultLatLng != null
            ? defaultLatLng.longitude
            : defaultLatLng!.longitude.toDouble(),
        latitude: defaultLatLng != null
            ? defaultLatLng.latitude
            : defaultLatLng!.latitude.toDouble(),
        timestamp: DateTime.now(),
        accuracy: 1,
        altitude: 1,
        altitudeAccuracy: 1,
        heading: 1,
        headingAccuracy: 1,
        speed: 1,
        speedAccuracy: 1,
      );

      print("error" + e);
    });
  }

  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  Future<void> updatePosition(CameraPosition position, bool fromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();

      try {
        if (fromAddress) {
          _position = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            altitudeAccuracy: 1,
            heading: 1,
            headingAccuracy: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        } else {
          _pickPosition = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            altitudeAccuracy: 1,
            heading: 1,
            headingAccuracy: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        }

        ResponseModel _responseModel = await getZone(
            position.target.latitude.toString(),
            position.target.longitude.toString(),
            false);
        _buttonDisabled = !_responseModel.isSuccess;

        if (_changeAddress) {
          String _address = await getAddressfromGeocode(
            LatLng(
              position.target.latitude,
              position.target.longitude,
            ),
          );
          fromAddress
              ? _placemark = Placemark(name: _address)
              : _pickPlacemark = Placemark(name: _address);
        } else {
          _changeAddress = true;
        }
      } catch (e) {
        print(e.toString());
      }

      _loading = false;
      update();
    } else {
      _updateAddressData = true;
    }
  }

  Future<String> getAddressfromGeocode(LatLng latlng) async {
    String _address = "Unknown Location Found!";
    Response response = await locationRepo.getAddressfromGeocode(latlng);
    if (response.body["status"] == 'OK') {
      _address = response.body['results'][0]['formatted_address'].toString();
    } else {
      print("Error getting the google api");
    }

    update();
    return _address;
  }

  AddressModel getUserAddress() {
    late AddressModel _addressModel;
    _getAddress = jsonDecode(locationRepo.getUserAddress());

    try {
      _addressModel =
          AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    } catch (e) {
      print(e.toString());
    }

    return _addressModel;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel> addAddress(AddressModel addressModel) async {
    _loading = true;
    update();
    Response response = await locationRepo.addAddress(addressModel);

    ResponseModel responseModel;
    if (response.statusCode == 200) {
      await getAddressList();
      String message = response.body('message');
      responseModel = ResponseModel(true, message);
      await saveUserAddress(addressModel);
    } else {
      print("could not save the address");
      responseModel = ResponseModel(false, response.statusText!);
    }

    update();
    return responseModel;
  }

  Future<void> getAddressList() async {
    Response response = await locationRepo.getAllAddress();

    if (response.statusCode == 200) {
      _addressList = [];
      _allAddressList = [];

      response.body.forEach((address) {
        _addressList.add(AddressModel.fromJson(address));
        _allAddressList.add(AddressModel.fromJson(address));
      });
    } else {
      _addressList = [];
      _allAddressList = [];
    }
    update();
  }

  Future<bool> saveUserAddress(AddressModel addressModel) async {
    String userAddress = jsonEncode(addressModel.toJson());
    return await locationRepo.saveUserAddress(userAddress);
  }

  void clearAddressList() {
    _addressList = [];
    _allAddressList = [];
    update();
  }

  String getUserAddressFromLocalStorage() {
    return locationRepo.getUserAddress();
  }

  void setAddAddressData() {
    _position = _pickPosition;
    _placemark = _pickPlacemark;
    _updateAddressData = false;
    update();
  }

  Future<ResponseModel> getZone(String lat, String lng, bool markerLoad) async {
    late ResponseModel _responseModel;
    if (markerLoad) {
      _loading = true;
    } else {
      _isLoading = true;
    }
    update();

    Response response = await locationRepo.getZone(lat, lng);
    if (response.statusCode == 200) {
      _inZone = true;
      _responseModel = ResponseModel(true, response.body['zone_id'].toString());
    } else {
      _inZone = false;
      _responseModel = ResponseModel(true, response.statusText!);
    }

    if (markerLoad) {
      _loading = false;
    } else {
      _isLoading = false;
    }

    //print("Zone response code is "+response.statusCode.toString());
    update();

    return _responseModel;
  }

  Future<List<Prediction>> searchLocation(
      BuildContext context, String text) async {
    if (text.isNotEmpty) {
      Response response = await locationRepo.searchLocation(text);
      if (response.statusCode == 200 && response.body['status'] == ['OK']) {
        _predictionList = [];
        response.body['predictions'].forEach((prediction) =>
            _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }

  Future<void> setLocation(
      String placeID, String address, GoogleMapController mapController) async {
    _loading = true;
    update();

    PlacesDetailsResponse detail;
    Response response = await locationRepo.setLocation(placeID);
    detail = PlacesDetailsResponse.fromJson(response.body);

    _pickPosition = Position(
      latitude: detail.result.geometry!.location.lat,
      longitude: detail.result.geometry!.location.lng,
      timestamp: DateTime.now(),
      accuracy: 1,
      altitude: 1,
      altitudeAccuracy: 1,
      heading: 1,
      headingAccuracy: 1,
      speed: 1,
      speedAccuracy: 1,
    );
    _pickPlacemark = Placemark(name: address);
    _changeAddress = false;
    if (!mapController.isNull) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              detail.result.geometry!.location.lat,
              detail.result.geometry!.location.lng,
            ),
            zoom: 17,
          ),
        ),
      );
    }
    _loading = false;
    update();
  }
}
