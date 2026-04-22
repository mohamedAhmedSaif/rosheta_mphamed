import 'package:cure_craft/core/resources/routs_manager.dart';
import 'package:flutter/cupertino.dart';

class AppNavigation {
  AppNavigation._();

  static void pushNamed(
    BuildContext context, {
    required RoutesNameManager routesName,
  }) => Navigator.pushNamed(context, routesName as String);

  static void pop(BuildContext context) => Navigator.pop(context);

  static void pushNamedAndRemoveUntil(
    BuildContext context, {
    required RoutesNameManager routesName,
  }) => Navigator.pushNamedAndRemoveUntil(context,routesName as String,(route) => true,);
}
