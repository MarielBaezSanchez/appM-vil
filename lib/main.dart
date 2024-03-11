import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:historial_exit/main_app.dart';
import 'package:historial_exit/screens/home_screen.dart';
import 'package:historial_exit/screens/login_screen.dart';
import 'package:historial_exit/screens/sign_up_page.dart';
import 'package:historial_exit/screens/splash_screen.dart';


Future main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: const  FirebaseOptions(
    apiKey: "AIzaSyC9SiIADI6KsHuPNIl4yLTbMkxQGZd6OHE",
    appId: "1:609434170931:web:bd39cc13b981dd30f81546",
    messagingSenderId: "609434170931",
    projectId:"flutterfirebase-fddbe")
    );
  } else {
    await Firebase.initializeApp();
  }
  
  runApp( const MainApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sensor de Oxigenación',
      routes: {
        '/': (context) => const SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/inicio': (context) => const HomeScreen(),
      },
    );
  }
}


