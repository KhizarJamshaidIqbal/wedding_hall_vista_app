import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wedding_hall_visla/features/splash/splash_screen.dart';
import 'firebase_options.dart';

List<CameraDescription>? cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: load camera
  cameras = await availableCameras();

  // TODO: Flutter fire Initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.Build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding Hall Vista App',
      home: SplashScreen(),
    );
  }
}
