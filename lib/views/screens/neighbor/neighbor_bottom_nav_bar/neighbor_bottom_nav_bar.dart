import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../neighbor_home/neighbor_home_screen.dart';


class NeighborBottomNavBar extends StatefulWidget {
  const NeighborBottomNavBar({super.key});

  @override
  State<NeighborBottomNavBar> createState() => _NeighborBottomNavBarState();
}

class _NeighborBottomNavBarState extends State<NeighborBottomNavBar> {
 static int _selectedIndex = 0;

  final List<Widget> _screens = [
    NeighborHomeScreen(),
    NeighborHomeScreen(),
    NeighborHomeScreen(),
    NeighborHomeScreen(),
    NeighborHomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(
      icon: Assets.icons.home.svg(width: 24, color: _selectedIndex == 0 ? AppColors.primaryColor :  Color(0xff7C7C7C) ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Assets.icons.hubs.svg(width: 24, color: _selectedIndex == 1 ? AppColors.primaryColor :  Color(0xff7C7C7C) ),
      label: 'Hubs',
    ),
    BottomNavigationBarItem(
      icon: Assets.icons.createButtomNa.svg(width: 24, color: _selectedIndex == 2 ? AppColors.primaryColor :  Color(0xff7C7C7C) ),
      label: 'Create',
    ),
    BottomNavigationBarItem(
      icon: Assets.icons.schedule.svg(width: 24, color: _selectedIndex == 3 ? AppColors.primaryColor :  Color(0xff7C7C7C) ),
      label: 'Schedule',
    ),
    BottomNavigationBarItem(
      icon: Assets.icons.profile.svg(width: 24, color: _selectedIndex == 4 ? AppColors.primaryColor :  Color(0xff7C7C7C) ),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Color(0xff7C7C7C),
        items: _navItems,
      ),
    );
  }
}