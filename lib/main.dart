import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocx/app_wrappper.dart';
import 'package:ocx/bloc/wallet/bloc.dart';
import 'package:ocx/service/secure_storage.dart';
import 'package:ocx/service/wallet_service.dart';

void main() {
  runApp(const OCX());
}

class OCX extends StatelessWidget {
  const OCX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            /// wallet bloc provider
            create: (context) => WalletBloc(
              secureStorage: SecureStorage(), // secure storage instance
              walletService:
                  EtherWalletService(), //ethereum wallet service instance
            ),
          )
        ],

        /// app wrapper
        child: const AppWrapper(),
      ),
    );
  }
}
