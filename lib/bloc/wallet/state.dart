import 'package:equatable/equatable.dart';

class WalletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletInitialState extends WalletState {}

class LoadingState extends WalletState {}

class MnemonicGeneratedState extends WalletState {
  final List<String> seedPhrase;

  MnemonicGeneratedState({required this.seedPhrase});

  @override
  List<Object?> get props => [seedPhrase];
}

class WalletSecuredStated extends WalletState {}

class CreateProcessDone extends WalletState {}
