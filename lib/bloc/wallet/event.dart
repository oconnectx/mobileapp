import 'package:equatable/equatable.dart';

class WalletEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateWalletEvent extends WalletEvent {}

class ImportWalletEvent extends WalletEvent {
  final List<String> seedPhrase;

  ImportWalletEvent({required this.seedPhrase});

  @override
  List<Object?> get props => [seedPhrase];
}
