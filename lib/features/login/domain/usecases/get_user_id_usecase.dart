import '../repos/firebase_login_repository.dart';

class GetUserIdUseCase {
  final FirebaseLoginRespository firebaseLoginRespository;

  GetUserIdUseCase({required this.firebaseLoginRespository});

  Future<String> call() {
    return firebaseLoginRespository.getUserId();
  }
}
