import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  Future<User?> register(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirebaseFirestore.instance
        .collection('user')
        .doc(cred.user!.uid)
        .set({
          'email': email,
          'isSetupProfile': false,
          'createAt': FieldValue.serverTimestamp(),
        });

    return cred.user;
  }

  Future<User?> login(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  Future<void> logout() async => await _auth.signOut();

  User? get currentUser => _auth.currentUser;

  Future<bool?> getIsSetupProfile() async {
    if (currentUser == null) return null;

    final docSnap = await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUser!.uid)
        .get();

    if (docSnap.exists) {
      return docSnap.data()?['isSetupProfile'] as bool?;
    }
    return null;
  }

  Future<void> updateIsSetupProfile(bool value) async {
    if (currentUser == null) return;

    await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUser!.uid)
        .update({'isSetupProfile': value});
  }
}
