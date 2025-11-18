import 'package:flutter/material.dart';
import 'package:certamen2_garateojedarodriguez/screen/Bottombar.dart';
import 'package:certamen2_garateojedarodriguez/themes/theme.dart'; 
import 'package:certamen2_garateojedarodriguez/screen/splashscreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyABq1M8wKQ_Nw9ojp8gjA3i-W58jD2-U7M",
        authDomain: "farmacialareina-a56a2.firebaseapp.com",
        projectId: "farmacialareina-a56a2",
        storageBucket: "farmacialareina-a56a2.firebasestorage.app",
        messagingSenderId: "130030861282",
        appId: "1:130030861282:web:da0fc0a52576270ea3d7bb"
      ),
    );
  } on FirebaseException catch (e) {
    // Si la app ya estaba inicializada, ignora el error
    if (e.code != 'duplicate-app') rethrow;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,

      
      theme: AppTheme.light,   
      darkTheme: AppTheme.dark,

      home: const SplashScreen(), // ← Solo cambié esto
    );
  }
}