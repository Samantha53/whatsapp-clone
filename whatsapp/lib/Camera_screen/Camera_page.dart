import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class Camera_screen extends StatefulWidget {
  const Camera_screen({super.key});

  @override
  State<Camera_screen> createState() => _Camera_screenState();
}

class _Camera_screenState extends State<Camera_screen> {
  int index = 0;
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  Future<void>? CameraValue;
  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[index], ResolutionPreset.high);
    CameraValue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: CameraValue,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.photo,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.panorama_fish_eye,
                    size: 80,
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        index = index == 0 ? 1 : 0;
                        _cameraController = CameraController(
                            cameras[index], ResolutionPreset.high);
                        CameraValue = _cameraController.initialize();
                      });
                    },
                    icon: Icon(
                      Icons.switch_camera,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
