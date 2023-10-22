import 'package:alquran_api/features/login/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;

  const UserModel({
    this.uid,
    this.email,
    this.name,
    this.password,
  }) : super(
          uid: uid,
          name: name,
          email: email,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {
    var snapshot = snap.data()!;

    return UserModel(
      name: snapshot['name'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      password: snapshot['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "email": email,
        "password": password,
      };
}
