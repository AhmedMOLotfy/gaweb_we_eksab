// import 'dart:async';
// import 'dart:io';
//
// //import 'package:camera/camera.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' show join;
// import 'package:path_provider/path_provider.dart';
//
// class TakePictureScreen extends StatefulWidget {
//  // final CameraDescription camera;
//
//   //const TakePictureScreen({
//     //Key key,
//     //@required this.camera,
//   //}) : super(key: key);
//
//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }
//
// class TakePictureScreenState extends State<TakePictureScreen> {
//  // CameraController _controller;
//   Future<void> _initializeControllerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     // To display the current output from the Camera,
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.camera,
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );
//
//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFC7EDE6),
//         centerTitle: true,
//         title: Text(
//           'اتصل بنا',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       // Wait until the controller is initialized before displaying the
//       // camera preview. Use a FutureBuilder to display a loading spinner
//       // until the controller has finished initializing.
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview.
//             return Column(
//               children: [
//                 Container(
//                   height: 1,
//                   child: CameraPreview(_controller),
//                 ),
//                 Card(
//                     margin:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                     child: ListTile(
//                       leading: Icon(
//                         Icons.phone,
//                         color: Colors.teal,
//                       ),
//                       title: Text(
//                         '+20 155 272 4214',
//                         style: TextStyle(
//                           color: Colors.teal.shade900,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     )),
//                 Card(
//                   margin:
//                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.email,
//                       color: Colors.teal,
//                     ),
//                     title: Text(
//                       'ahmed195016@fci.bu.edu.eg',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.teal.shade900,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             // Otherwise, display a loading indicator.
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         // Provide an onPressed callback.
//         onPressed: () async {
//           // Take the Picture in a try / catch block. If anything goes wrong,
//           // catch the error.
//           try {
//             // Ensure that the camera is initialized.
//             await _initializeControllerFuture;
//
//             // Construct the path where the image should be saved using the
//             // pattern package.
//             final path = join(
//               // Store the picture in the temp directory.
//               // Find the temp directory using the `path_provider` plugin.
//               (await getTemporaryDirectory()).path,
//               '${DateTime.now()}.png',
//             );
//
//             // Attempt to take a picture and log where it's been saved.
//             await _controller.takePicture(path);
//
//             // If the picture was taken, display it on a new screen.
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(
//                   imagePath: path,
//                   path: path,
//                 ),
//               ),
//             );
//           } catch (e) {
//             // If an error occurs, log the error to the console.
//             print(e);
//           }
//         },
//       ),
//     );
//   }
// }
//
// // A widget that displays the picture taken by the user.
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;
//   final String path;
//   const DisplayPictureScreen({Key key, this.imagePath, this.path})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final storageReference = FirebaseStorage.instance.ref().child(path);
//
//     final uploadTask = storageReference.putFile((File(imagePath)));
//     uploadTask.then((e) => print(e));
//     return Scaffold(
//       appBar: AppBar(title: Text('Error')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Container(
//         height: 1,
//         child: Image.file(File(imagePath)),
//       ),
//     );
//   }
// }
