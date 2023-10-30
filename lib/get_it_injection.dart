import 'package:alquran_api/common/endpoint/app_endpoint.dart';
import 'package:alquran_api/common/endpoint/uri_helper.dart';
import 'package:alquran_api/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:alquran_api/features/home/data/datasources/quran_remote_datasources.dart';
import 'package:alquran_api/features/home/data/repos/quran_repository_impl.dart';
import 'package:alquran_api/features/home/domain/repos/quran_repository.dart';
import 'package:alquran_api/features/home/domain/usecases/detail_surah_usecases.dart';
import 'package:alquran_api/features/home/domain/usecases/surah_usecases.dart';
import 'package:alquran_api/features/home/presentation/cubit/detail_surah_cubit/detail_surah_cubit.dart';
import 'package:alquran_api/features/home/presentation/cubit/surah_cubit/surah_cubit.dart';
import 'package:alquran_api/features/login/data/datasources/remote_data_source.dart';
import 'package:alquran_api/features/login/data/datasources/remote_data_source_impl.dart';
import 'package:alquran_api/features/login/data/repos/firebase_repository_impl.dart';
import 'package:alquran_api/features/login/domain/repos/firebase_login_repository.dart';
import 'package:alquran_api/features/login/domain/usecases/get_single_user_usecases.dart';
import 'package:alquran_api/features/login/domain/usecases/get_user_id_usecase.dart';
import 'package:alquran_api/features/login/domain/usecases/is_sign_in_usecases.dart';
import 'package:alquran_api/features/login/domain/usecases/set_user_usecases.dart';
import 'package:alquran_api/features/login/domain/usecases/sign_in_usecases.dart';
import 'package:alquran_api/features/login/domain/usecases/sign_out_usecases.dart';
import 'package:alquran_api/features/login/domain/usecases/sign_up_usecase.dart';
import 'package:alquran_api/features/login/presentation/cubit/auth/auth_cubit.dart';
import 'package:alquran_api/features/login/presentation/cubit/single_user/single_user_cubit.dart';
import 'package:alquran_api/features/login/presentation/cubit/user/user_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt locator = GetIt.instance;

Future<void> init() async {
  // cubit
  locator.registerFactory(() => AuthCubit(
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory(() => UserCubit(
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory(() => DashboardCubit());
  locator.registerFactory(() => SingleUserCubit(locator()));
  locator.registerFactory(() => SurahCubit(locator()));
  locator.registerFactory(() => DetailSurahCubit(locator()));

  // usecases
  locator.registerLazySingleton<SetUserUseCase>(
      () => SetUserUseCase(firebaseLoginRespository: locator()));
  locator.registerLazySingleton<IsSignInUseCases>(
      () => IsSignInUseCases(firebaseLoginRespository: locator()));
  locator.registerLazySingleton<GetUserIdUseCase>(
      () => GetUserIdUseCase(firebaseLoginRespository: locator()));
  locator.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(firebaseLoginRespository: locator()));
  locator.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(firebaseLoginRespository: locator()));
  locator.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(firebaseLoginRespository: locator()));
  locator.registerLazySingleton<GetSingleUserUseCase>(
      () => GetSingleUserUseCase(repository: locator()));
  locator.registerLazySingleton(() => SurahUsecases(locator()));
  locator.registerLazySingleton(() => DetailSurahUsecases(locator()));

  // repository
  locator.registerLazySingleton<FirebaseLoginRespository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDataSource: locator()));
  locator.registerLazySingleton<QuranRepository>(
      () => QuranRepositoryImpl(remoteDatasource: locator()));

  // dataSource
  locator.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(
          firebaseFirestore: locator(), firebaseAuth: locator()));
  locator.registerLazySingleton<QuranRemoteDatasource>(() =>
      QuranRemoteDatasourceImpl(client: locator(), appEndPoint: locator()));

  // external
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  locator.registerLazySingleton<FirebaseAuth>(() => auth);
  locator.registerLazySingleton<FirebaseFirestore>(() => firestore);
  locator.registerLazySingleton<http.Client>(() => http.Client());
  locator.registerLazySingleton(() => AppEndPoint("equran.id"));
  locator.registerLazySingleton(() => UriHelper());
}
