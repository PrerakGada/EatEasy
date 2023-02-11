import 'package:eat_easy/screens/Customer/map.dart';
import 'package:flutter/material.dart';

class ExploreMap extends StatefulWidget {
  static const String id = '/exploremap';

  const ExploreMap({Key? key}) : super(key: key);

  @override
  State<ExploreMap> createState() => _ExploreMapState();
}

class _ExploreMapState extends State<ExploreMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: EventsMap(),
        ),
      ),
    );
  }
}
