import 'package:alquran_api/features/login/data/datasources/remote_data_source.dart';
import 'package:alquran_api/features/login/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class FirebaseRemoteDataSourceImpl extends FirebaseRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  FirebaseRemoteDataSourceImpl(
      {required this.firebaseFirestore, required this.firebaseAuth});

  @override
  Future<String> getUserId() async {
    return firebaseAuth.currentUser!.uid;
  }

  @override
  Future<bool> isSignIn() async {
    return firebaseAuth.currentUser?.uid != null;
  }

  @override
  Future<void> setUser(UserEntity user) async {
    final CollectionReference collectionReference =
        firebaseFirestore.collection('users');

    final uid = await getUserId();

    try {
      collectionReference.doc(user.uid).set({
        'uid': uid,
        'email': user.email,
        'name': user.name,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signIn(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty || user.password!.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: user.email!, password: user.password!);
      } else {
        throw ('Tidak boleh kosong');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw ("user not found");
      } else if (e.code == "wrong-password") {
        throw ("Invalid email or password");
      }
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUp(UserEntity user) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    final userCollection = firebaseFirestore
        .collection('users')
        .where("uid", isEqualTo: uid)
        .limit(1);
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }
}
