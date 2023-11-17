// ignore_for_file: file_names

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/home/home_view.dart';
import 'package:travellio/app/screens/host_trip/host_trip_view.dart';
import 'package:travellio/app/screens/profile/profile_view.dart';
import 'package:travellio/app/screens/saved_trips/saved_trips_view.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';

class BuildLayout extends GetView<BuildLayoutController> {

  final List<Widget> pageList = [
    HomeView(),
    hostTripView(),
    HomeView(),
    const SavedTrips(),
    ProfileView(),
  ];

  BuildLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: pageList[controller.selectedIndex.value],
        extendBody: true,
        bottomNavigationBar: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DotNavigationBar(
            itemPadding:
                const EdgeInsets.symmetric(horizontal: 15.7, vertical: 5),
            items: [
              DotNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: AppColor.botomNavBarItem,
                ),
              ),
              DotNavigationBarItem(
                icon: Icon(
                  Icons.location_on,
                  color: AppColor.botomNavBarItem,
                ),
              ),
              DotNavigationBarItem(
                icon: Icon(
                  Icons.chat_rounded,
                  color: AppColor.botomNavBarItem,
                ),
              ),
              DotNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: AppColor.botomNavBarItem,
                ),
              ),
              DotNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: AppColor.botomNavBarItem,
                ),
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: AppColor.weirdBlue,
            onTap: controller.changeIndex,
          ),
        ),
      );
    });
  }
}
