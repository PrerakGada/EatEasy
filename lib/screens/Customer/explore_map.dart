import 'package:eat_easy/Theme/app_colors.dart';
import 'package:eat_easy/screens/Customer/map.dart';
import 'package:eat_easy/stores/user_store.dart';
import 'package:flutter/material.dart';

class ExploreMap extends StatefulWidget {
  static const String id = '/exploremap';

  const ExploreMap({Key? key}) : super(key: key);

  @override
  State<ExploreMap> createState() => _ExploreMapState();
}

class _ExploreMapState extends State<ExploreMap> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await UserStore().fetchAllProviders();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Explore Providers'),
        backgroundColor: AppColors.primaryAccent,
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
