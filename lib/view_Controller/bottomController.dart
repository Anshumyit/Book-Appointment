import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetBottom extends GetxController{
  RxInt selectedItem = 0.obs;

  void changeIndex(int index) {
    selectedItem.value = index;
  }
}