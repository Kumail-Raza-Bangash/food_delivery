import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController? googleMapController;

  const PickAddressMap({
    super.key,
    required this.fromSignup,
    required this.fromAddress,
    this.googleMapController,
  });

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initialPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.find<LocationController>().addressList.isEmpty) {
      _initialPosition = const LatLng(45.521563, -122.677433);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
    }
    else{
      if(Get.find<LocationController>().addressList.isNotEmpty){
        _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress["latitude"]), 
          double.parse(Get.find<LocationController>().getAddress["longitude"]),
        );
        _cameraPosition = CameraPosition(
          target: _initialPosition, 
          zoom: 17,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.maxFinite,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 17,
                  ),
                  zoomControlsEnabled: false,
                  onCameraMove: (CameraPosition cameraPosition){
                    _cameraPosition = cameraPosition;
                  },
                  onCameraIdle: (){
                    Get.find<LocationController>().updatePosition(_cameraPosition, false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
