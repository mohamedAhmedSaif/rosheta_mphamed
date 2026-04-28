import 'package:cure_craft/core/resources/app_navigation.dart';
import 'package:cure_craft/core/resources/font_size_manager.dart';
import 'package:cure_craft/core/resources/height.dart';
import 'package:cure_craft/core/resources/routs_manager.dart';
import 'package:cure_craft/core/resources/utils.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/image_manager.dart';
import '../../../core/resources/raduis_manager.dart';
import '../../../core/resources/width.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(Utils.signUp)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: WidthManager.w20,vertical: HeightManager.h20),
        child: Column(
          children: [
            SizedBox(height: HeightManager.h30,),

            Center(child: Image.asset(ImageManager.logo)),
            SizedBox(height: HeightManager.h30,),
            TextField(
              decoration: InputDecoration(
                hintText: Utils.name,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RaduisManager.r12),
                ),
              ),
            ),

             SizedBox(height:HeightManager.h20),

            TextField(
              decoration: InputDecoration(
                hintText: Utils.Email,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RaduisManager.r12),
                ),
              ),
            ),

            SizedBox(height:HeightManager.h20),

            TextField(
              decoration: InputDecoration(
                hintText: Utils.Password,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RaduisManager.r12),
                ),
              ),
            ),

             SizedBox(height:HeightManager.h30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  ColorManager.primary,
                minimumSize:  Size(double.infinity,HeightManager.h50),
              ),
              onPressed: (){                Dialog signin = Dialog(

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RaduisManager.r12)), //this right here
                child: Container(
                  height: HeightManager.h300,
                  width: WidthManager.w300,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, size: FontSizeManager.f100, color: ColorManager.green,),
                      Text(Utils.success,style: TextStyle(fontSize: FontSizeManager.f20),), Text(Utils.successMessage),Text(Utils.registered),
                      ElevatedButton(onPressed: () {
                        AppNavigation.pushNamed(context, routesName: RoutesNameManager.login);
                      }, child: Text(Utils.login))
                    ],
                  ),
                ),
              );
              showDialog(context: context, builder: (BuildContext context) => signin);
              },
              child:  Text(Utils.signUp),
            )

          ],
        ),
      ),
    );
  }
}