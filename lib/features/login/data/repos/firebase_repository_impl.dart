import 'package:alquran_api/features/login/data/datasources/remote_data_source.dart';
import 'package:alquran_api/features/login/domain/entities/user_entity.dart';
import 'package:alquran_api/features/login/domain/repos/firebase_login_repository.dart';

class FirebaseRepositoryImpl extends FirebaseLoginRespository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  FirebaseRepositoryImpl({required this.firebaseRemoteDataSource});

  @override
  Future<String> getUserId() async {
    return firebaseRemoteDataSource.getUserId();
  }

  @override
  Future<bool> isSignIn() async {
    return firebaseRemoteDataSource.isSignIn();
  }

  @override
  Future<void> setUser(UserEntity user) {
    return firebaseRemoteDataSource.setUser(user);
  }

  @override
  Future<void> signIn(UserEntity user) async {
    return firebaseRemoteDataSource.signIn(user);
  }

  @override
  Future<void> signOut() async {
    return firebaseRemoteDataSource.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) {
    return firebaseRemoteDataSource.signUp(user);
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) =>
      firebaseRemoteDataSource.getSingleUser(uid);
}
