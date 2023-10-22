import 'package:alquran_api/features/login/domain/repos/firebase_login_repository.dart';

import '../entities/user_entity.dart';

class GetSingleUserUseCase {
  final FirebaseLoginRespository repository;

  GetSingleUserUseCase({required this.repository});

  Stream<List<UserEntity>> call(String uid) {
    return repository.getSingleUser(uid);
  }
}
