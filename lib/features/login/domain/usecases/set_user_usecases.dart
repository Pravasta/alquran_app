import '../entities/user_entity.dart';
import '../repos/firebase_login_repository.dart';

class SetUserUseCase {
  final FirebaseLoginRespository firebaseLoginRespository;

  SetUserUseCase({required this.firebaseLoginRespository});

  Future<void> call(UserEntity user) {
    return firebaseLoginRespository.setUser(user);
  }
}
