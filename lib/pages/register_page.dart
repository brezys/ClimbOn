import 'dart:math';

import 'package:climbon/components/signin_button.dart';
import 'package:climbon/components/textfield_comp.dart';
import 'package:climbon/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{

  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Instantiate the text controller
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  // Registering Logic
  void register() async {
      //loading circle
      showDialog(
        context: context, 
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
          ),
        );


      //make sure passwords match
      if (passwordController.text != confirmpasswordController.text){
        // get rid of loading circle
        Navigator.pop(context);

        //show error
        displayMessage("Passwords don't match", context);
      }else{
          //try create urser
        try{
          UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        
        //get rid of loading circle
          Navigator.pop(context);
        }on FirebaseAuthException catch(e){
          //get rid of circle and show error dialog to user
          Navigator.pop(context);
          displayMessage(e.code, context);
        }
      }


      



  }

  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      
      body: Center(child: SingleChildScrollView(
          child: Center(
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

              Text(('Register to create your account'),
                style: TextStyle(fontSize: 15),
              ),

              const SizedBox(height: 30,),

              // Username field
                TextfieldComp(
                hintText: 'Username', 
                obscureText: false, 
                controller: usernameController,
                ),

              const SizedBox(height: 20,),

              // Email field
                TextfieldComp(
                hintText: 'Email', 
                obscureText: false, 
                controller: emailController,
                ),

              const SizedBox(height: 20,),


              // Password field
                TextfieldComp(
                hintText: 'Password', 
                obscureText: true, 
                controller: passwordController,
                ),


              const SizedBox(height: 20,),

              // Confirm password field
              TextfieldComp(
                hintText: 'Confirm Password', 
                obscureText: true, 
                controller: confirmpasswordController,
                ),

              const SizedBox(height: 20,),

              // Register button
              SigninButton(
                text: 'Register',
                onTap: register, 
                color: Colors.blue,
                ),


              const SizedBox(height: 35,),


              // Already have an account? Login

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(" Login",
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
      )
        
      )
      
    );
  }
}
  
// Handle emojis


