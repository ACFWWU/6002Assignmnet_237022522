import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class locationPage extends StatelessWidget {
  const locationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GeolocationApp(),
    );
  }
}

class GeolocationApp extends StatefulWidget {
  const GeolocationApp({super.key});

  @override
  State<GeolocationApp> createState() => _GeolocationAppState();
}

class _GeolocationAppState extends State<GeolocationApp>{
  @override
  Widget build(BuildContext context){
    Position? _currentPosition;
    late bool servicePermission = false;
    late  LocationPermission permission;
    String _currentAddress = " ";

    Future<Position>_getCurrentLocation() async {
      servicePermission = await Geolocator.isLocationServiceEnabled();
      if(!servicePermission){
         permission = await Geolocator.checkPermission();      
         }
         return await Geolocator.getCurrentPosition();
    }                                                    



    return const Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Get Your Location'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Location corrdinates", 
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 8,),
              Text("address"),
              SizedBox(height: 45,),
              // ElevatedButton(
              // //   onPressed: () async{
              // //   _currentAddress = await _getCurrentLocation();
              // //   print("${_currentAddress}");
              // // },
              // child: Text("get Location"))
          ],
        ),
      ),
    );
  }
}

// class Location extends StatefulWidget {
//   const Location({super.key, required this.title});

//   final String title;

//   @override
//   State<Location> createState() => _locationState();
// }

// class _locationState extends State<Location> {
//   int counter = 0;

//   void incrementCounter() {
//     setState(() {
//       counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Your location:'),
//             Text(
//               '$_location',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _getLocation,
//         tooltip: 'Get location',
//         child: const Icon(Icons.add_location),
//         backgroundColor: Colors.deepPurple,
//       ),
//     );
//   }

//   void _getLocation() async {
//     setState(() {
//       _location = 'Loading...';
//     });
//   }
// }