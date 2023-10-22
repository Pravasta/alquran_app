import '../repos/firebase_login_repository.dart';

class SignOutUseCase {
  final FirebaseLoginRespository firebaseLoginRespository;

  SignOutUseCase({required this.firebaseLoginRespository});

  Future<void> call() {
    return firebaseLoginRespository.signOut();
  }
}
