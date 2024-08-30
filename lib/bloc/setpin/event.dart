import 'package:equatable/equatable.dart';

class SetPinEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NumPadPressed extends SetPinEvent {
  final String num;

  NumPadPressed(this.num);

  @override
  List<Object?> get props => [num];
}

class BackspacePressed extends SetPinEvent {}

class ClearPressed extends SetPinEvent {}
