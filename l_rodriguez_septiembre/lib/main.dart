import 'package:flutter/material.dart';
import 'package:l_rodriguez_septiembre/screen/splashscreen.dart'; 
import 'package:l_rodriguez_septiembre/screen/chat.dart'; // Importa el archivo chats.dart
import 'package:l_rodriguez_septiembre/theme/theme.dart'; // Importa el tema
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme, // Usa el tema claro
      darkTheme: AppTheme.darkTheme, // Usa el tema oscuro
      themeMode: ThemeMode.system, // Cambia según la configuración del sistema
      home: const SplashScreen(), // La primera pantalla será el SplashScreen
    );
  }
}

// Aquí tienes la pantalla que será el home después del splash
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatsScreen(); // Usa el ChatsScreen en lugar de la lista
  }
}