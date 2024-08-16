import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocx/bloc/wallet/event.dart';
import 'package:ocx/bloc/wallet/state.dart';
import 'package:ocx/service/secure_storage.dart';
import 'package:ocx/service/wallet_service.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final SecureStorage secureStorage;
  final WalletService walletService;

  WalletBloc({required this.secureStorage, required this.walletService})
      : super(WalletInitialState()) {
    on<CreateWalletEvent>(_createWallet);
    on<ImportWalletEvent>(_importWallet);
  }

  _createWallet(CreateWalletEvent event, Emitter emit) async {}

  _importWallet(ImportWalletEvent event, Emitter emit) async {}
}
