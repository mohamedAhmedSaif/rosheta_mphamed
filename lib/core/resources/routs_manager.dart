import 'package:flutter/material.dart';
import '../../view/doctor_consultation/doctor_consultation_screens/doctor_consultation_page.dart';
import '../../view/home/home_screens/home_page.dart';
import '../../view/login_and_sing/login_and_sing_screens/login.dart';
import '../../view/login_and_sing/login_and_sing_screens/sign_in.dart';
import '../../view/onboarding/onboarding_screen/onboarding_page.dart';
import '../../view/online_pharmacy/online_pharmacy_screens/online_pharmacy_page.dart';
import '../../view/profile/profile_screens/profile_page.dart';
import '../../view/reset_create_password/reset_create_password_screens/reset_create_password_page.dart';
import '../unknown_rout_page.dart';

class RoutsManager {
  RoutsManager._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page;

    if (RoutesNameManager.login.routeName == "/") {
      page = OnboardingPage();
    }   else if (RoutesNameManager.onboarding.routeName == "/home") {
      page = HomePage();
    }  else  if (RoutesNameManager.onboarding.routeName == "/login") {
      page = Login();
    }else  if (RoutesNameManager.onboarding.routeName == "/signin") {
      page = SignIn();
    }  else  if (RoutesNameManager.onboarding.routeName == "/doctor") {
      page = DoctorConsultationMainPage();
    }  else  if (RoutesNameManager.onboarding.routeName == "/pharmacy") {
      page = OnlinePharmacyPage();
    }  else  if (RoutesNameManager.onboarding.routeName == "/profile") {
      page = ProfilePage();
    }  else  if (RoutesNameManager.onboarding.routeName == "/password") {
      page = ResetCreatePasswordPage();
    } else{
      page = UnknownRoutPage();
    }
    return MaterialPageRoute(builder: (context) => page, settings: settings);

  }

}

enum RoutesNameManager {
  onboarding("/"),
  home("/home"),
  login("/login"),
  signIn("/signin"),
  doctor("/doctor"),
  pharmacy("/pharmacy"),
  profile("/profile"),
  password("/password");

  final String routeName;

  const RoutesNameManager(this.routeName);
}
