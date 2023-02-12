import 'package:eat_easy/screens/Customer/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../stores/user_store.dart';
import '../Provider/provider_view_screen.dart';

class EventsMap extends StatefulWidget {
  const EventsMap({
    Key? key,
  }) : super(key: key);

  @override
  State<EventsMap> createState() => _EventsMapState();
}

class _EventsMapState extends State<EventsMap> {
  // DataService? d1;
  GoogleMapController? mapController;

  void initstate() {
    super.initState();

    // ignore: prefer_collection_literals
    markers = Set.from([]);
  }

  void _onmapcreated(GoogleMapController controller) {
    // setState(() {
    //   markers.add(
    //     Marker(
    //         icon:
    //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    //         infoWindow: InfoWindow(
    //           title: 'Hello world',
    //           snippet: 'Basic',
    //         ),
    //         markerId: MarkerId('id-1'),
    //         position: LatLng(19.0960, 72.8777)),
    //   );
    // });
  }

  //final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};

  BitmapDescriptor? customIcon1;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.0760, 72.8777),
    zoom: 10.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<UserStore>(builder: (_, userStore, __) {
      final allProviders = userStore.allProviders;
      // print('This are allProviders: '+allProviders.toString());
      print(allProviders.length);
      return Container(
        color: Colors.blue,
        width: MediaQuery.of(context).size.width * 0.9,
        height: 400,
        child: Column(
          children: [
            SizedBox(
              height: 0,
              child: ListView.builder(
                itemCount: allProviders.length,
                itemBuilder: (context, index) {
                  final currProvider = allProviders[index];
                  final String currLang = currProvider['lang'].toString();
                  final String currLat = currProvider['lat'].toString();
                  print(currLat);
                  print(currLang);
                  markers.add(
                    Marker(
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueMagenta),
                      infoWindow: InfoWindow(
                        onTap: () {
                          // print(currProvider);
                          Navigator.push(
                            context,
                            PageTransition(
                              child: KitchenView(
                                kitchendetails: currProvider,
                              ),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        title: currProvider['name'],
                        snippet: currProvider['description'],
                      ),
                      markerId: MarkerId('$index'),
                      position: LatLng(
                        // currProvider['lat'],
                        // currProvider['lang'],
                        double.parse(currProvider['lat'].toString()),
                        double.parse(currProvider['lang'].toString()),
                        // double.parse('19.02149${index}3'),
                        // double.parse('72.83821429999999'),
                      ),
                    ),
                  );
                  return Container();
                },
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 600,
                width: 400,
                child: GoogleMap(
                  onMapCreated: _onmapcreated,
                  initialCameraPosition: _kGooglePlex,
                  markers: markers,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
