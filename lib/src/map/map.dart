import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
class MapPage extends StatefulWidget{
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>{
  
// @override
// Widget build(BuildContext context){
//   return const Scaffold(
//     body: GoogleMap(
//       initialCameraPosition: CameraPosition(
//         target: LatLng(45.521563, -122.677433),
//         zoom: 11,
//       ),
//     ),
//   );
// }

// // //use google map api
//  late GoogleMapController mapController;

//   final LatLng _center = const LatLng(-23.5557714,-46.6395571);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.green[700],
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Maps Sample App'),
//           backgroundColor: Colors.green[700],
//           elevation: 2,
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//           ),
//         ),
//       ),
//     );
//   }
Future<void> getPosition() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}
  @override
  Widget build(BuildContext context){
  return Scaffold(
    body: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(45.521563, -122.677433),
        zoom: 11,
      ),
    )
  );  
    // return Scaffold(
    //   appBar: AppBar(
    //     //show the tittle in  middle of appbar
    //     //show the positition of user
    //     centerTitle: true,
    //     backgroundColor: Colors.blueGrey,
    //     foregroundColor: Colors.white,
    //     title: Text('Map'),
    //     elevation: 0.0,
    //   ),
    // );
  }



}