import 'dart:math';

import 'package:climbon/components/signin_button.dart';
import 'package:climbon/components/textfield_comp.dart';
import 'package:climbon/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Instantiate the text controller
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  //Login logic
  void login() async {
    
    //loading circle
    showDialog(
        context: context, 
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
          ),
        );

    //try login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch(e){
        Navigator.pop(context);
        displayMessage(e.code, context);
    }

      
  }

  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text & Emoji logo
              Text(
                ('ClimbOn🧗'),
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),

            
              const SizedBox(height: 18,),

              //Sign in to access your account

              Text(('Sign in to access your account'),
                style: TextStyle(fontSize: 15),
              ),

              const SizedBox(height: 30,),

              // Email field
                TextfieldComp(
                hintText: 'Email', 
                obscureText: false, 
                controller: emailController,
                ),

              const SizedBox(height: 27,),


              // Password field
                TextfieldComp(
                hintText: 'Password', 
                obscureText: true, 
                controller: passwordController,
                ),


              const SizedBox(height: 28,),


              // Sign in button
              SigninButton(
                text: 'Sign In',
                onTap: login, 
                color: Colors.blue,
                ),


              const SizedBox(height: 35,),


              // Dont have an account? Register

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(" Register",
                      style: 
                      TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      ),
                  ),),
                ],
              ),


              const SizedBox(height: 25,),

              // Forgot password
              Text(
                'Forgot Passowrd?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
  
// Handle emojis


