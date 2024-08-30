import 'package:equatable/equatable.dart';

class SetPinState extends Equatable {
  final String visible;
  final String pin;

  const SetPinState({required this.pin, required this.visible});

  SetPinState copyWith({visible, pin}) {
    
    return SetPinState(pin: this.pin + (pin ?? ""), visible: visible  ?? this.visible);
  }

  SetPinState clear() {
    return const SetPinState(pin: "", visible: "");
  }

  SetPinState backspace() {
    return SetPinState(
      pin: (pin.isEmpty) ? "" : pin.substring(0, pin.length - 1),
      visible:
          (visible.isEmpty) ? "" : visible.substring(0, visible.length - 1),
    );
  }

  @override
  List<Object?> get props => [pin, visible];
}
