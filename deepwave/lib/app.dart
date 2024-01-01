import 'package:deepwave/blocs/auth/auth_bloc.dart';
import 'package:deepwave/repositories/auth/auth_repository.dart';
import 'package:deepwave/screens/splash/splash_screen.dart';
import 'package:deepwave/utils/app_router.dart';
import 'package:deepwave/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AuthRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => AuthBloc(
                      authRepository: context.read<AuthRepository>(),
                    )),
          ],
          child: MaterialApp(
            title: 'DeepWave App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
          ),
        ));
  }
}
