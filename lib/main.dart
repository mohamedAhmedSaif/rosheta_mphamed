import 'package:cure_craft/view/Basket_card/Basket_Card/Basket_Card.dart';
import 'package:cure_craft/view/Pharmacy_Dashboard/Pharmacy_Dashboard/Pharmacy_Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'view/login_and_sing/login_and_sing_screens/login.dart';
void main (){
  runApp (ScreenUtilInit(
    designSize: const  Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    // Use builder only if you need to use library outside ScreenUtilInit context
    builder: (_, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
home: Login(),
      );
    },
  ));
}