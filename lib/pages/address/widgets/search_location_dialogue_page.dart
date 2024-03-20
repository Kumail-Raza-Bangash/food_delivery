// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationDialogue extends StatelessWidget {
  
  final GoogleMapController mapController;

  const LocationDialogue({
    super.key,
    required this.mapController,
    });

  @override
  Widget build(BuildContext context) {

    final TextEditingController _controller = TextEditingController();

    return Container(
      padding: EdgeInsets.all(Dimensions.width10),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20/2),
        ),
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _controller,
              textInputAction: TextInputAction.search,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.streetAddress,
            ),
            suggestionsCallback: (String pattern) {
              
            }, 
            itemBuilder: (BuildContext context, Object? itemData) {
              
            }, 
            onSuggestionSelected: (suggestion){

            }
          ),
        ),
      ),
    );
  }
}