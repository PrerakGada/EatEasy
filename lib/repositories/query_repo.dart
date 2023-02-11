import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;

class QueryRepo {
  var applications = [];

  Future fetchPendingApprovals() async {
    await _firestore.collection("providers").get().then((event) {
      for (var doc in event.docs) {
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
      _firestore
          .collection('providers')
          .doc(id)
          .update({'approval': true});
      return true;
    } catch (e) {
      print(e);
    }
  }
}
