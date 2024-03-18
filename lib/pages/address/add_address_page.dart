import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLogged;
  late LatLng _initialPosition = const LatLng(45.51563, -122.677433);

  CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(45.51563, -122.677433),
    zoom: 17,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    if (_isLogged && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']),
          double.parse(Get.find<LocationController>().getAddress['longitude']),
        ),
      );
      _initialPosition = LatLng(
        double.parse(Get.find<LocationController>().getAddress['latitude']),
        double.parse(Get.find<LocationController>().getAddress['longitude']),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address page'),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        if(userController.userModel != null && _contactPersonName.text.isEmpty){
          _contactPersonName.text = '${userController.userModel?.name}';
          _contactPersonNumber.text = '${userController.userModel?.phone}';

          if(Get.find<LocationController>().addressList.isNotEmpty){
            _addressController.text = Get.find<LocationController>().getUserAddress().address;
          }
        }

        return GetBuilder<LocationController>(builder: (locationController) {
          _addressController.text = '${locationController.placemark.name ?? ''}'
              '${locationController.placemark.locality ?? ''}'
              '${locationController.placemark.postalCode ?? ''}'
              '${locationController.placemark.country ?? ''}';

          print("address in my view: " + _addressController.text);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimensions.height20*7,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: Dimensions.height10/2, left: Dimensions.width10/2, right: Dimensions.width10/2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                  border: Border.all(
                    width: 2,
                    color: AppColors.mainColor,
                  ),
                ),
                child: Stack(
                  children: [
                    GoogleMap(
                        initialCameraPosition:
                            CameraPosition(target: _initialPosition, zoom: 17),
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        indoorViewEnabled: true,
                        mapToolbarEnabled: true,
                        onCameraIdle: () {
                          locationController.updatePosition(
                              _cameraPosition, true);
                        },
                        onCameraMove: ((position) =>
                            _cameraPosition = position),
                        onMapCreated: (GoogleMapController controller) {
                          locationController.setMapController(controller);
                        }),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: BigText(text: "Delivery Address"),
              ),
              SizedBox(height: Dimensions.height10/2),
              AppTextField(
                  textController: _addressController,
                  hintText: "Your address",
                  icon: Icons.map),
              SizedBox(height: Dimensions.height20),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: BigText(text: "Contact Name"),
              ),
              SizedBox(height: Dimensions.height10/2),
              AppTextField(
                  textController: _contactPersonName,
                  hintText: "Your Name",
                  icon: Icons.person),
              SizedBox(height: Dimensions.height20),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: BigText(text: "Your Number"),
              ),
              SizedBox(height: Dimensions.height10/2),
              AppTextField(
                  textController: _contactPersonNumber,
                  hintText: "Your Phone",
                  icon: Icons.phone),
            ],
          );
        });
      }),
    );
  }
}
