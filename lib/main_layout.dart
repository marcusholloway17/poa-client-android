import 'package:hdl/screens/appointement_page.dart';
import 'package:hdl/screens/fav_page.dart';
import 'package:hdl/screens/home.dart';
import 'package:hdl/screens/profile_page.dart';
import'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


 class MainLayout extends StatefulWidget {
   const MainLayout({Key? key}) : super(key: key);

   @override
   State<MainLayout> createState() => _MainLayoutState();
 }

 class _MainLayoutState extends State<MainLayout> {

   int currentPage = 0;
   final PageController _page = PageController();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body:PageView(
         controller: _page,
         onPageChanged: ((value) {
           setState(() {
             currentPage=value;
           });
         }),
         children: const <Widget>[
           Home(),
           FavPage(),
           AppointmentPage(),
           Profilepage()
         ],
       ),
       bottomNavigationBar: BottomNavigationBar(
         currentIndex: currentPage,
         onTap: (page) {
           setState(() {
             currentPage = page;
             _page.animateToPage(
               page,
               duration: const Duration(milliseconds: 500),
               curve: Curves.easeInOut,
             );
           });
         },
         items:  const <BottomNavigationBarItem> [
           BottomNavigationBarItem(
             icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
             label: 'Home',
           ),
           BottomNavigationBarItem(
             icon: FaIcon(FontAwesomeIcons.solidHeart),
             label: 'Favorite',
           ),
           BottomNavigationBarItem(
             icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
             label: 'Appointments',
           ),
           BottomNavigationBarItem(
             icon: FaIcon(FontAwesomeIcons.solidUser),
             label: 'Profile',
           ),
         ],

       ),
     );
   }
 }
