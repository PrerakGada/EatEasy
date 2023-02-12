import 'package:eat_easy/repositories/query_repo.dart';
import 'package:eat_easy/stores/state_keeper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserStore extends StateKeeper {
  UserStore._();

  static final UserStore _instance = UserStore._();

  factory UserStore() => _instance;

  List providers = [];
  List pendingProviders = [];
  List completedProviders = [];
  List orders = [];
  List restros = [];

  var currUser;

  late double lat;
  late double lang;
  late String address;

  Future fetchPendingProviders() async {
    pendingProviders = await QueryRepo().fetchPendingApprovals();
    print(pendingProviders);
    notifyListeners();
  }

  Future fetchPendingOrders() async {
    orders = await QueryRepo().fetchOrders();
    print(orders);
    notifyListeners();
  }

  Future fetchNearestRestros() async {
    restros = await QueryRepo().fetchRestros();
    print(restros);
    notifyListeners();
  }

  Future fetchCompletedProviders() async {
    completedProviders = await QueryRepo().fetchCompletedApprovals();
    print(completedProviders);
    notifyListeners();
  }

  Future getCurrUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      currUser = await QueryRepo().fetchCurrUser();
      return currUser;
    }
  }
}
