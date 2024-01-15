import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class homePage extends StatefulWidget{
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>{
  File? _selectedImage; 

Future picImageFromCamera() async {
  final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  if (returnedImage == null) return;
  setState(() {
    _selectedImage = File(returnedImage.path);
  
  });
}

// Future<void> takePhoto() async {
//   final imagePicker = ImagePicker();
//   final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
  
//   if (pickedImage != null) {
//     final appDir = await getApplicationDocumentsDirectory();
//     final directory = Directory('${appDir.path}/Image');
//     if (!await directory.exists()) {
//       await directory.create(recursive: true);
//     }

//     final fileName = DateTime.now().toIso8601String();
//     final savedImage = await pickedImage.saveTo('${directory.path}/$fileName.png');
    
//     //save the image to the directory

//   }
// }

  @override
  // Widget build(BuildContext context){
  //   return Scaffold(
  //     appBar: AppBar(
  //       //show the tittle in  middle of appbar
  //       centerTitle: true,
  //       backgroundColor: Colors.blueGrey,
  //       foregroundColor: Colors.white,
  //       title: Text('Wu Store'),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Your Photo'),
    ),
    body: Center(
      child: _selectedImage != null
          ? Image.file(_selectedImage!)
          : Text('No photo taken.'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: picImageFromCamera,
      child: Icon(Icons.camera_alt),
    ),
  );
}
}
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homePage(),
  ));
}