import 'package:alquran_api/common/routes/route_handler.dart';
import 'package:alquran_api/constant/theme_data.dart';
import 'package:alquran_api/features/login/presentation/cubit/auth/auth_cubit.dart';
import 'package:alquran_api/features/login/presentation/cubit/single_user/single_user_cubit.dart';
import 'package:alquran_api/features/login/presentation/cubit/user/user_cubit.dart';
import 'package:alquran_api/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'get_it_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.locator<AuthCubit>()..appStarted(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => di.locator<UserCubit>(),
        ),
        BlocProvider<DashboardCubit>(
            create: (_) => di.locator<DashboardCubit>()),
        BlocProvider<SingleUserCubit>(
            create: (_) => di.locator<SingleUserCubit>()),
      ],
      child: MaterialApp(
        theme: ThemeDataColor.lightColor,
        darkTheme: ThemeDataColor.darkColor,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteHandler.generateRoute,
        initialRoute: RouteHandler.initialRoutes,
      ),
    );
  }
}
