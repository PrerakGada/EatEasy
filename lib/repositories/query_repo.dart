import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_easy/stores/user_store.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;

class QueryRepo {
  Future fetchCurrUser() async {
    var email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      _firestore.collection('users').get().then((value) {
        for (var doc in value.docs) {
          final docData = doc.data();
          if (docData['email'] == email) {
            UserStore().currUser = docData['role'];
            //break;
          }
        }
        print(UserStore().currUser);
      });
    }
  }

  var applications = [];

  Future fetchPendingApprovals() async {
    await _firestore.collection("providers").get().then((value) {
      for (var doc in value.docs) {
        // print("${doc.id} => ${doc.data()}");
        final docData = doc.data();
        if (docData['approval'] == false) applications.add(docData);
      }
    });
    return applications;
  }

  Future submitProviderVerification(
    String name,
    String email,
    String mobile,
    String description,
    String FSSAI,
    String GST,
  ) async {
    try {
      _firestore.collection('providers').doc('$name:$email').set({
        'name': name,
        'email': email,
        'description': description,
        'mobile': mobile,
        'FSSAI': FSSAI,
        'GST': GST,
        'approval': false
      });
      return true;
    } catch (e) {
      print(e);
    }
  }

  Future approveProvider(String id) async {
    try {
      _firestore.collection('providers').doc(id).update({'approval': true});
      return true;
    } catch (e) {
      print(e);
    }
  }
}
