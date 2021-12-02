import 'dart:async';
import 'dart:math';

import 'package:chappers/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'directions.dart';
import 'repository.dart';

class UserLocationScreen extends StatefulWidget {
  const UserLocationScreen({Key? key}) : super(key: key);

  @override
  State<UserLocationScreen> createState() => MapSampleState();
}

class MapSampleState extends State<UserLocationScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Set<Marker> markers = {};

  var geoLocator=Geolocator();
  double pad=0;
  var mylocation="";
  var destination="";

  final startAddressController = TextEditingController();

  double startLatitude = 0;
  double startLongitude=0;
  String startCoordinatesString="";


  getCurrentLocation() async{

    Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high,);

    LatLng latLng=LatLng(position.latitude, position.longitude);
    CameraPosition _camPos=CameraPosition(target: latLng,zoom: 14.0);
    final GoogleMapController mapController = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(_camPos));

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place=placemarks[0];
    String? name = place.name;
    String? subLocality = place.subLocality;
    String? locality = place.locality;
    String? administrativeArea = place.administrativeArea;
    String? postalCode = place.postalCode;
    String? country = place.country;
    String address = "$locality, $administrativeArea, $country";


    List<Location> startPlacemark = await locationFromAddress(address);


    setState(() {
      position=position;
      mylocation=address;
      startAddressController.text = address;
      startLatitude = startPlacemark[0].latitude;
      startLongitude = startPlacemark[0].longitude;
      startCoordinatesString = '($startLatitude, $startLongitude)';

    });
    Marker startMarker = Marker(
      markerId: MarkerId(startCoordinatesString),
      position: LatLng(startLatitude, startLongitude),
      infoWindow: InfoWindow(
        title: 'Start $startCoordinatesString',
        snippet: mylocation,
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
    markers.add(startMarker);

  }
  //double des=getCurrentLocation().position.latitude;
  double destinationLongitude=0;
  double destinationLatitude=0;
  String destinationCoordinatesString="";
  PolylinePoints polylinePoints=PolylinePoints();

  List<LatLng> polylineCoordinates = [];

  Map<PolylineId, Polyline> polylines = {};
  String _placeDistance ="";
  searchPlace() async {

    final GoogleMapController mapController = await _controller.future;

    locationFromAddress(searchAddress).then((result) async {
      LatLng latLng=LatLng(result[0].latitude, result[0].longitude);

      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 10,

      )));
      List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      Placemark place=placemarks[0];
      String? name = place.name;
      String? subLocality = place.subLocality;
      String? locality = place.locality;
      String? administrativeArea = place.administrativeArea;
      String? postalCode = place.postalCode;
      String? country = place.country;
      String address = "$locality, $administrativeArea, $country";
      List<Location> destinationPlacemark = await locationFromAddress(address);

      setState(() {
        destination=address;
        destinationLatitude = destinationPlacemark[0].latitude;
        destinationLongitude = destinationPlacemark[0].longitude;
        destinationCoordinatesString = '($destinationLatitude, $destinationLongitude)';

      });
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $startCoordinatesString',
          snippet: destination,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(90),
      );

      markers.add(destinationMarker);

    });


  }


  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  _createPolylines() async {
    Set<Polyline> _polylines = {};
    polylinePoints = PolylinePoints();
    print('Start Latitudeee: '+'$startLatitude');
    print("Start Latitude: " + '$startLongitude');
    print('Destination Latitude:'+'$destinationLatitude');
    print('Destination Longitude: ' + '$destinationLongitude');
    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCAr7cdaLZK5g9RXjVFc5czXue78j0IwQE", // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    final GoogleMapController mapController = await _controller.future;
    final directions = await DirectionsRepository()
        .getDirections(origin: LatLng(startLatitude, startLongitude), destination: LatLng(destinationLatitude, destinationLongitude),);
    setState(() => _info = directions);
    double distanceInMeters = await Geolocator.bearingBetween(
      startLatitude,
      startLongitude,
      destinationLatitude,
      destinationLongitude,
    );
    double totalDistance = 0.0;

    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    setState(() {
      _placeDistance = totalDistance.toStringAsFixed(2);
      PolylineId id = PolylineId('poly');
      Polyline polyline = Polyline(
          polylineId: id,
          color: Colors.red,
          //points: polylineCoordinates,
          width: 3,
        points: _info!.polylinePoints
            .map((e) => LatLng(e.latitude, e.longitude))
            .toList(),
      );

      _polylines.add(polyline);
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;
      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );
    });
  }

  Directions? _info;

  @override
  void dispose() async {
    final GoogleMapController mapController = await _controller.future;
    mapController.dispose();
    super.dispose();
  }

  String searchAddress="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Stack(
          children: [
            GoogleMap(
             markers: Set<Marker>.from(markers),
              polylines: {
            if (_info != null)
            Polyline(
            polylineId: const PolylineId('overview_polyline'),
            color: Colors.red,
            width: 5,
            points: _info!.polylinePoints
                .map((e) => LatLng(e.latitude, e.longitude))
                .toList(),
            ),
            },
              padding: EdgeInsets.only(bottom: pad),
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: _kGooglePlex,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) async {
                _controller.complete(controller);
                final GoogleMapController mapController= await _controller.future;
                mapController==controller;
                 setState((){
                   pad=MediaQuery.of(context).size.height*0.3;
                 });
                getCurrentLocation();

              },
            ),
            if (_info != null)
              Positioned(
                top: 20.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: Text(
                    '${_info!.totalDistance}, ${_info!.totalDuration}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.28,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 16.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7,0.7),
                      ),

                    ]
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:24.0,vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 10.0,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                5.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 6.0,
                                spreadRadius: 0.5,
                                offset: Offset(0.7,0.7),
                              ),

                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Where To Go',
                                border: InputBorder.none,
                                suffixIcon: IconButton(onPressed: () { searchPlace(); }, icon: Icon(Icons.search),iconSize: 30.0,

                                )
                            ),
                            onChanged: (val){
                              setState(() {
                                searchAddress=val;
                              });
                            },

                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Visibility(
                        visible: _placeDistance == null ? false : true,
                        child: Text(
                          'DISTANCE: $_placeDistance km',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),

                      Container(
                        height: 35,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          minWidth : MediaQuery.of(context).size.width* 0.9,

                          color: Color(0xFFCD3424),
                          child: Text("Go", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),),
                          onPressed: () async {
                            _createPolylines();
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),

          ]
      ),
      bottomNavigationBar: CustomNavBar(more: true,),
    );
  }


}