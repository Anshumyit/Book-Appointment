import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loginb/view/Home.dart';
import 'package:loginb/view/Notification.dart';
import 'package:loginb/view/contacts.dart';
import 'package:loginb/view/profile.dart';
import 'package:loginb/view_Controller/bottomController.dart';

class HomeScren extends StatelessWidget {
   HomeScren({super.key});

   final GetBottom controller =Get.put(GetBottom());

  final List<Widget> screens = [
    Home(),
    Notification1(),
    contacts(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: Obx(()=>BottomNavigationBar(
        backgroundColor: HexColor('#122c67'),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.white,
        iconSize: 30,
        currentIndex: controller.selectedItem.value,
        onTap: (index) {
          controller.changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_rounded),label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.phone),label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.people),label: 'Profile')
        ]
    ),),
      body: Obx(() => screens[controller.selectedItem.value]),
    );
  }
}
