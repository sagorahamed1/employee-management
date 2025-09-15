import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/screens/neighbor/hub/schedule_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../create_task/create_task_screen.dart';
import '../../profile/profile_screen.dart';
import '../hub/hub_screen.dart';
import '../neighbor_home/neighbor_home_screen.dart';


class NeighborBottomNavBar extends StatefulWidget {
  const NeighborBottomNavBar({super.key});

  @override
  State<NeighborBottomNavBar> createState() => _NeighborBottomNavBarState();
}

class _NeighborBottomNavBarState extends State<NeighborBottomNavBar> {
 static int _selectedIndex = 0;

   List<Widget> _screens = [
    NeighborHomeScreen(),
    HubScreen(),
    CreateTaskScreen(),
    ScheduleScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 @override
 Widget build(BuildContext context) {
   print("===============selected index : $_selectedIndex");

   List<BottomNavigationBarItem> _navItems = [
     BottomNavigationBarItem(
       icon: Assets.icons.home.svg(
           width: 24,
           color: _selectedIndex == 0
               ? AppColors.primaryColor
               : Color(0xff7C7C7C)),
       label: 'Home',
     ),
     BottomNavigationBarItem(
       icon: _selectedIndex == 1
           ? Assets.icons.hubs.svg(color: AppColors.primaryColor)
           : Assets.icons.hubUnSelected.svg(color: Colors.grey),
       label: 'Hubs',
     ),
     BottomNavigationBarItem(
       icon: _selectedIndex == 2
           ? Assets.icons.createSeleted.svg(width: 24, color: AppColors.primaryColor)
           : Assets.icons.createButtomNa.svg(width: 24, color: Colors.grey),
       label: 'Create',
     ),
     BottomNavigationBarItem(
       icon: _selectedIndex == 3
           ? Assets.icons.scheduleSelected.svg(width: 24)
           : Assets.icons.scheduleIconsHome.svg(width: 24),
       label: 'Schedule',
     ),
     BottomNavigationBarItem(
       icon: _selectedIndex == 4
           ? Assets.icons.profileSelected.svg(width: 24)
           : Assets.icons.profile.svg(width: 24),
       label: 'Profile',
     ),
   ];

   return Scaffold(
     body: _screens[_selectedIndex],
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       currentIndex: _selectedIndex,
       onTap: _onItemTapped,
       unselectedIconTheme: IconThemeData(color: Colors.grey),
       selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
       selectedItemColor: AppColors.primaryColor,
       unselectedItemColor: Color(0xff7C7C7C),
       items: _navItems,
     ),
   );
 }

}