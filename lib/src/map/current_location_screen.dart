// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class CurrentLocationScreen extends StatefulWidget {
//   const CurrentLocationScreen({Key? key}) : super(key: key);

//   @override
//   _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
// }

// class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
//   late GoogleMapController googleMapController;

//   static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

//   Set<Marker> markers = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("User current location"),
//         centerTitle: true,
//       ),
//       body: GoogleMap(
//         initialCameraPosition: initialCameraPosition,
//         markers: markers,
//         zoomControlsEnabled: false,
//         mapType: MapType.normal,
//         onMapCreated: (GoogleMapController controller) {
//           googleMapController = controller;
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () async {
//           Position position = await _determinePosition();

//           googleMapController
//               .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


//           markers.clear();

//           markers.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude)));

//           setState(() {});

//         },
//         label: const Text("Current Location"),
//         icon: const Icon(Icons.location_history),
//       ),
//     );
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled');
//     }

//     permission = await Geolocator.checkPermission();

//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();

//       if (permission == LocationPermission.denied) {
//         return Future.error("Location permission denied");
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied');
//     }

//     Position position = await Geolocator.getCurrentPosition();

//     return position;
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchPartnersView extends StatefulWidget {
  const SearchPartnersView({super.key});

  @override
  State<SearchPartnersView> createState() => _SearchPartnersViewState();
}

class _SearchPartnersViewState extends State<SearchPartnersView> {

  final Completer<GoogleMapController> _controller = Completer();
  //This controller is important;

  //Don't forget of calling the dispose method;
  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  Future<void> _disposeController() async {
  final GoogleMapController controller = await _controller.future;
  controller.dispose();
}
  @override
  Widget build(BuildContext context) {
    CameraPosition vegasPosition = const CameraPosition(target: LatLng(36.0953103, -115.1992098), zoom: 10);
    return  Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: vegasPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        )
      );
    }
  }