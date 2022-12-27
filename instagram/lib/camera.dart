import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:instagram/preview_page.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key}) : super(key: key);

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  CameraController? controller;
  bool _isCameraInitialized = false;

  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  Future takePicture() async {
    if (!controller!.value.isInitialized) {
      return null;
    }
    if (controller!.value.isTakingPicture) {
      return null;
    }
    try {
      XFile picture = await controller!.takePicture();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewPage(
              picture: picture,
            ),
          ));
    } on CameraException catch (e) {
      debugPrint('Error while taking picture: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            (controller!.value.isInitialized)
                ? CameraPreview(controller!)
                : Container(
                    color: Colors.black,
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Go Back!')),
                  IconButton(
                    onPressed: takePicture,
                    icon: Icon(
                      CupertinoIcons.camera_circle,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
