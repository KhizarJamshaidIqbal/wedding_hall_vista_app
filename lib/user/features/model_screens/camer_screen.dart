// ignore_for_file: file_names, unused_local_variable, unused_element, prefer_const_constructors, avoid_print, use_key_in_widget_constructors, use_build_context_synchronously, unnecessary_null_comparison

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wedding_hall_visla/constants/colors.dart';
import 'package:wedding_hall_visla/main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraImage imgCamera;
  late CameraController cameraController;
  bool isWorking = false;
  String result = "";
  bool isFlashOn = false;

  initCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);

    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        cameraController.startImageStream((imageFromStream) {
          if (!isWorking) {
            isWorking = true;
            imgCamera = imageFromStream;
          }
        });
      });
      // Set flash mode to torch initially
      // cameraController.setFlashMode(FlashMode.torch);
    });
  }

  @override
  void initState() {
    super.initState();

    initCamera();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
    // cameraController.setFlashMode(FlashMode.off);
    // cameraController.stopImageStream();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: (!cameraController.value.isInitialized)
                    ? Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff2B2A2A)),
                      )
                    : AspectRatio(
                        aspectRatio: cameraController.value.aspectRatio,
                        child: CameraPreview(cameraController),
                      ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: globalColors.primaryColor,
          child: Icon(
            Icons.add_a_photo_outlined,
            color: globalColors.WhiteColor,
          ),
          onPressed: () async {
            XFile? image = await cameraController.takePicture();
            if (image != null || image == null) {
              // Set flash mode to off
              // cameraController.setFlashMode(FlashMode.off);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         Attempted(imagePath: image.path),
              //   ),
              // );
            }
          },
        ),
      ),
    );
  }
}
