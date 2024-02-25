// // import 'package:flutter/gestures.dart'; // fix
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// // import 'package:flutter_web_plugins/url_strategy.dart';
// // import 'backend/firebase/firebase_config.dart'; // how is this unused?
// import 'map_settings/map_settings_theme.dart';
// import 'map_settings/map_settings_util.dart';
// import 'map_settings/nav/nav.dart';
// // import 'index.dart';
// // import 'package:golden_circle/app.dart';

// class MapScreen extends StatefulWidget {
//   // Basic Map Generation
//   @override
//   State<MapScreen> createState() => _MapScreenState();

//   static _MapScreenState of(BuildContext context) =>
//       context.findAncestorStateOfType<_MapScreenState>()!;
// }

// class _MapScreenState extends State<MapScreen> {
//   ThemeMode _themeMode = FlutterFlowTheme.themeMode;

//   late AppStateNotifier _appStateNotifier;
//   late GoRouter _router;

//   @override
//   void initState() {
//     super.initState();

//     _appStateNotifier = AppStateNotifier.instance;
//     _router = createRouter(_appStateNotifier);
//   }

//   void setThemeMode(ThemeMode mode) => setState(() {
//         _themeMode = mode;
//         FlutterFlowTheme.saveThemeMode(mode);
//       });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'golden_circle',
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const [Locale('en', '')],
//       theme: ThemeData(
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       themeMode: _themeMode,
//       routerConfig: _router,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  String mapTheme = '';

  final LatLng _center = const LatLng(37.4220, -122.0841);
  late String lat;
  late String long;

  Set<Marker> markers = {};

  //final List<String> images = ['lib/assets/images/circle.png'];
  final List<Marker> _marker = [];
  final List<Marker> _list = [
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(37.4275, -122.1697),
        infoWindow: InfoWindow(title: 'Standford Community Services')),
    const Marker(
        markerId: MarkerId('2'),
        position: LatLng(37.3382, -121.8863),
        infoWindow: InfoWindow(title: 'San Jose Elderly Care')),
    const Marker(
        markerId: MarkerId('3'),
        position: LatLng(37.3230, -122.0322),
        infoWindow: InfoWindow(title: 'Cupertino Senior Center')),
    const Marker(
        markerId: MarkerId('4'),
        position: LatLng(37.4082, -122.0636),
        infoWindow: InfoWindow(title: 'Nasa Ames Visitor Center')),
    const Marker(
        markerId: MarkerId('5'),
        position: LatLng(37.7335, -122.3905),
        infoWindow: InfoWindow(title: 'Bayview Senior Services:')),
    const Marker(
        markerId: MarkerId('6'),
        position: LatLng(37.3722, -121.8476),
        infoWindow: InfoWindow(title: 'Loyola Park')),
    const Marker(
        markerId: MarkerId('7'),
        position: LatLng(37.4001, -122.0854),
        infoWindow: InfoWindow(title: 'Monta Loma, Art Galleries')),
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission are permanently denied");
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  void _livelocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
    // DefaultAssetBundle.of(context)
    //     .loadString('lib/assets/maptheme/silver_theme.json')
    //     .then((value) {
    //   mapTheme = value;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Golden Circle'),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            SafeArea(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition:
                    CameraPosition(target: _center, zoom: 11.0),
                markers: Set<Marker>.of(_marker),
              ),
            ),
            Positioned(
              top: 20.0, // Adjust as necessary
              left: 20.0, // Adjust as necessary
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                onPressed: () => mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: _center, zoom: 11.0),
                  ),
                ),
                child: const Icon(Icons.center_focus_strong),
              ),
            ),
            Positioned(
              top: 20.0, // Adjust as necessary
              right: 20.0, // Adjust as necessary
              child: FloatingActionButton.extended(
                onPressed: () async {
                  Position position = await _determinePosition();

                  mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(position.latitude, position.longitude),
                        zoom: 14,
                      ),
                    ),
                  );

                  markers.clear();
                  markers.add(Marker(
                    markerId: MarkerId('CurrentLocation'),
                    position: LatLng(position.latitude, position.longitude),
                  ));

                  setState(() {});
                },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                label: const Text('Current Location'),
                icon: const Icon(Icons.location_history),
              ),
            ),
          ],
        ),
      ),
    );
  }
}