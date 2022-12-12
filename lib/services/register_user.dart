import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterUser {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUserDetail({
    required String email,
    required String name,
    required int phone,
    String? address,
  }) async {
    await _firestore.collection('Users').add({
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
    });
  }

  Future<void> getCurrentuserDetails() async {
    await _firestore
        .collection('Users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference.id);
            }));
  }
}
