import 'package:alquran_api/features/login/domain/entities/user_entity.dart';

abstract class FirebaseLoginRespository {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<void> setUser(UserEntity user);
  Future<String> getUserId();
  Stream<List<UserEntity>> getSingleUser(String uid);
}
