import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;

class QueryRepo {
  Future submitProviderVerification(
    String name,
    String email,
    String mobile,
    String description,
    String FSSAI,
    String GST,
  ) async {
    try {
      _firestore.collection('providers').doc('$name : $email').set({
        'name': name,
        'email': email,
        'description': description,
        'mobile': mobile,
        'FSSAI': FSSAI,
        'GST': GST,
      }
      );
      return true;
    } catch (e) {
      print(e);
    }
  }
}
