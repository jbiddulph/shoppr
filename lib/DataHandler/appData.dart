import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopper_app/Models/address.dart';

class AppData extends ChangeNotifier {
  Address pickUpLocation;

  void updatePickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}
