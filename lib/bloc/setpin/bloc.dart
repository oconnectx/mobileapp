import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocx/bloc/setpin/event.dart';
import 'package:ocx/bloc/setpin/state.dart';

class SetPinBloc extends Bloc<SetPinEvent, SetPinState> {
  SetPinBloc() : super(const SetPinState(visible: "", pin: "")) {
    on<NumPadPressed>(_numPressed);
    on<BackspacePressed>(_backspacePressed);
    on<ClearPressed>(_clearPressed);
  }

  _numPressed(NumPadPressed event, Emitter emit) async {
    if (state.pin.length == 6) {
      emit(state.copyWith());
      return;
    }
    emit(state.copyWith(
      visible: state.visible + event.num,
      pin: event.num,
    ));

    await Future.delayed(const Duration(milliseconds: 60));

    emit(state.copyWith(
      visible: '${state.visible.substring(0, state.visible.length - 1)}•',
    ));
  }

  _backspacePressed(BackspacePressed event, Emitter emit) {
    emit(state.backspace());
  }

  _clearPressed(ClearPressed event, Emitter emit) {
    emit(state.clear());
  }
}
