import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocx/bloc/wallet/bloc.dart';
import 'package:ocx/bloc/wallet/state.dart';
import 'package:ocx/ui/onboarding_screen.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(builder: (context, state) {
      return const OnboardingScreen();
    });
  }
}
