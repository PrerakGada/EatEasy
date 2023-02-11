import 'package:eat_easy/repositories/query_repo.dart';
import 'package:eat_easy/stores/state_keeper.dart';

class UserStore extends StateKeeper {
  UserStore._();

  static final UserStore _instance = UserStore._();

  factory UserStore() => _instance;

  List providers = [];
  List pendingProviders = [];

  Future fetchPendingProviders() async {
    pendingProviders = await QueryRepo().fetchPendingApprovals();
    print(pendingProviders);
    notifyListeners();
  }
}
