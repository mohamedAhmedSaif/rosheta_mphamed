import 'package:cure_craft/core/resources/utils.dart';
import 'package:cure_craft/view/login_and_sing/login_and_sing_screens/sign_in.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_size_manager.dart';
import '../../../core/resources/height.dart';
import '../../../core/resources/image_manager.dart';
import '../../../core/resources/raduis_manager.dart';
import '../../../core/resources/width.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.symmetric(horizontal: WidthManager.w20,vertical: HeightManager.h20),
        child: Column(children: [
      
           SizedBox(height: HeightManager.h80),
          Text(Utils.login, style: TextStyle(
              fontSize: FontSizeManager.f28, fontWeight: FontWeight.bold),),
          SizedBox(height: HeightManager.h30,),
      
          Center(child: Image.asset(ImageManager.logo)),
          SizedBox(height: HeightManager.h30,),
          SizedBox(height: HeightManager.h40),
          TextField(decoration: InputDecoration(hintText: Utils.Email,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(RaduisManager.r12),),),),
          SizedBox(height: HeightManager.h20),
          TextField(obscureText: true,
            decoration: InputDecoration(hintText: Utils.Password,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(RaduisManager.r12),),),),
          SizedBox(height: HeightManager.h30),
          ElevatedButton(style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primary,
            minimumSize: const Size(double.infinity, 50),), onPressed: () {
            Dialog login = Dialog(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(RaduisManager.r12)),
              child: Container( height: HeightManager.h300,
              width: WidthManager.w300, child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: FontSizeManager.f100,
                    color: ColorManager.green,),
                  Text(
                    Utils.welcomeBack, style: TextStyle(fontSize: FontSizeManager
                      .f20),),
                  Text(Utils.welcomeMessage),
                  Text(Utils.intoRoshetaApp),
                  ElevatedButton(onPressed: () {}, child: Text(Utils.goToHome))
                ],),)
            , ); showDialog(context: context, builder: (BuildContext
            context
            )
            =>
            login
            );
          }, child:  Text(Utils.login),),
          SizedBox(height: HeightManager.h20),
          TextButton(onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SignIn(),),);
          }, child: const Text("SignIn"),)
        ],),),
    ),);
  }
}