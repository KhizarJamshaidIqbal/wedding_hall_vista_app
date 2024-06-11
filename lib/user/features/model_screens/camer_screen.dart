import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController? controller; // Make controller nullable
  double imageScale = 1.0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final List<CameraDescription> cameras = await availableCameras();
      controller = CameraController(cameras[0], ResolutionPreset.max);
      await controller?.initialize();
      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {
      _handleCameraError(e);
    }
  }

  void _handleCameraError(CameraException error) {
    debugPrint('Error: ${error.code}\nError Message: ${error.description}');
    // Handle camera initialization errors here.
    // You can display an error message to the user or take appropriate action.
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            child: CameraPreview(controller!)),
          Positioned(
            child: Transform.scale(
              scale: imageScale,
              child: Image.asset(
                'assets/models/model.jpg', // Ensure this path is correct
                width: 300,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: 300,
              child: Slider(
                value: imageScale,
                min: 0.5,
                max: 2.0,
                onChanged: (value) {
                  setState(() {
                    imageScale = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
