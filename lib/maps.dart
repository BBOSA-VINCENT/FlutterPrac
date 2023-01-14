// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class MapSample extends StatefulWidget {
//   const MapSample({super.key});

//   @override
//   State<MapSample> createState() => _MapSampleState();
// }

// class _MapSampleState extends State<MapSample> {
//   LatLng? pos;
//   Future getLocation() async {
//     Location location = Location();
//     GoogleMapController? controller;
//     LocationData userLocation;
//     bool serviceActivated;
//     PermissionStatus permission;

//     serviceActivated = await location.serviceEnabled();
//     if (!serviceActivated) {
//       serviceActivated = await location.requestService();
//       if (serviceActivated) {
//         return;
//       }
//     }

//     permission = await location.hasPermission();
//     if (permission == PermissionStatus.denied) {
//       permission = await location.requestPermission();
//       if (permission == PermissionStatus.granted) {
//         return;
//       }
//     }

//     userLocation = await location.getLocation();
//     controller?.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: LatLng(userLocation.latitude!, userLocation.longitude!),
//           zoom: 19,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: getLocation(),
//         builder: (context, snapshot) {
//           return Scaffold(
//             body: const GoogleMap(
//               initialCameraPosition: CameraPosition(
//                   target: LatLng(38.356197, -122.573154), zoom: 10),
//             ),
//             floatingActionButton: FloatingActionButton.extended(
//               onPressed: getLocation,
//               label: const Text("locate"),
//               icon: const Icon(Icons.location_pin),
//             ),
//           );
//         });
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
