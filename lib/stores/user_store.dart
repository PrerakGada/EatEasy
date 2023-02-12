import 'package:eat_easy/repositories/query_repo.dart';
import 'package:eat_easy/stores/state_keeper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserStore extends StateKeeper {
  UserStore._();

  static final UserStore _instance = UserStore._();

  factory UserStore() => _instance;

  List allProviders = [];
  List pendingProviders = [];
  List completedProviders = [];

  var currUser;

  late double lat;
  late double lang;
  late String address;

  Future fetchPendingProviders() async {
    pendingProviders = await QueryRepo().fetchPendingApprovals();
    print(pendingProviders);
    notifyListeners();
  }

  Future fetchCompletedProviders() async {
    completedProviders = await QueryRepo().fetchCompletedApprovals();
    print(completedProviders);
    notifyListeners();
  }

  late List<Marker> allMarkers = [];

  Future fetchAllProviders() async {
    allProviders = await QueryRepo().fetchAllProviders();
    print('======================================================'+allProviders.length.toString());
    notifyListeners();
  }



  Future getCurrUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      currUser = await QueryRepo().fetchCurrUser();
      return currUser;
    }
  }
}
