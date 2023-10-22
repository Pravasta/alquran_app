import '../repos/firebase_login_repository.dart';

class IsSignInUseCases {
  final FirebaseLoginRespository firebaseLoginRespository;

  IsSignInUseCases({required this.firebaseLoginRespository});

  Future<bool> call() {
    return firebaseLoginRespository.isSignIn();
  }
}
