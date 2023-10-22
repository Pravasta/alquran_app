import 'package:alquran_api/features/login/domain/entities/user_entity.dart';
import 'package:alquran_api/features/login/domain/repos/firebase_login_repository.dart';

class SignInUseCase {
  final FirebaseLoginRespository firebaseLoginRespository;

  SignInUseCase({required this.firebaseLoginRespository});

  Future<void> call(UserEntity user) {
    return firebaseLoginRespository.signIn(user);
  }
}
