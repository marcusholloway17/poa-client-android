import 'package:hdl/screens/booking_page.dart';
import 'package:hdl/screens/success_booked.dart';
import 'package:flutter/material.dart';

import '../components/login_form.dart';
import '../main_layout.dart';
import '../screens/auth_page.dart';
import '../screens/doctor_detail.dart';
import '../screens/home.dart';
import '../screens/tes_screen.dart';


Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const Home(),
  '/login':(context)=>const LoginScreen(),
  '/authpage':(context)=>const AuthPage(),
  '/main':(context)=>const MainLayout(),
  //'/doc_details':(context)=> const DoctorDetail(),
  '/booking_page':(context)=> const BookingPage(),
  '/success_booking':(context)=> const AppointmentBooked(),
  '/test':(context)=> const test(),
};
