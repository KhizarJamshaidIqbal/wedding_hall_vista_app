import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'admin/share/custom bottom navigation bar/custom_bottom_navigation_bar.dart';
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
    return const MaterialApp(
      title: 'Wedding Hall Vista App',
      home: AdminCustomBottomNavigationbar(),
    );
  }
}
