import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importa el archivo generado por FlutterFire CLI

import 'package:cool_track/Vista/login.dart';
import 'package:cool_track/Vista/registro.dart';
import 'package:cool_track/Vista/rol_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Inicializa Firebase con las opciones correctas
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoolTrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const RolHome(),
        '/register': (context) => const Registro(),
      },
    );
  }
}
