import 'package:climbon/auth/auth.dart';
import 'package:climbon/auth/login_or_register.dart';
import 'package:climbon/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

//Light mode & Dark mode
import 'package:climbon/theme/light_mode.dart';
import 'package:climbon/theme/dark_mode.dart';

//Import Pages
import 'pages/login_page.dart';
import 'pages/qr_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async {
  
  await dotenv.load(fileName: "lib/.env");

  WidgetsFlutterBinding.ensureInitialized();

  
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClimbOn',
      home: const Auth(),
      theme: lightMode,
      darkTheme: mydarkMode,
    );
  }

}


  



