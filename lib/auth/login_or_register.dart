import 'package:climbon/main.dart';
import 'package:climbon/pages/login_page.dart';
import 'package:climbon/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget{
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();

}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool login = true;

  void togglePages() {
    setState(() {
      login = !login;
    });
  }

  @override
  Widget build(BuildContext context){
    if(login){
      return LoginPage(onTap: togglePages,);
    }else{
      return RegisterPage(onTap: togglePages);
    }
  }
}

