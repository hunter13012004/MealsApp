import 'package:flutter/material.dart';

class controllerProvider extends ChangeNotifier{
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller = TextEditingController();
}