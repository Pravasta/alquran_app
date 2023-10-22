import '../entities/user_entity.dart';
import '../repos/firebase_login_repository.dart';

class SignUpUseCase {
  final FirebaseLoginRespository firebaseLoginRespository;

  SignUpUseCase({required this.firebaseLoginRespository});

  Future<void> call(UserEntity user) {
    return firebaseLoginRespository.signUp(user);
  }
}
