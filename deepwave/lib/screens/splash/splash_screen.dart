import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../screens.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print('Listener');
          if (state.status == AuthStatus.authenticated) {
            Timer(
              const Duration(seconds: 2),
              () => Navigator.of(context).pushNamed(HomeScreen.routeName),
            );
          } else if (state.status == AuthStatus.unauthenticated) {
            Timer(
              const Duration(seconds: 2),
              () => Navigator.of(context).pushNamedAndRemoveUntil(
                OnboardingScreen.routeName,
                ModalRoute.withName('/onboarding'),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DeepWave',
                style: Theme.of(context).textTheme.displayLarge,
              )
            ],
          )),
        ),
      ),
    );
  }
}
