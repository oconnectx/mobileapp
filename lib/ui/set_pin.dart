import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocx/bloc/setpin/bloc.dart';
import 'package:ocx/bloc/setpin/event.dart';
import 'package:ocx/bloc/setpin/state.dart';
import 'package:simple_numpad/simple_numpad.dart';

class SetPin extends StatelessWidget {
  SetPin({super.key});

  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter pin',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                BlocListener<SetPinBloc, SetPinState>(
                  listener: (context, state) {
                    _pinController.text = state.visible;
                  },
                  child: TextField(
                    controller: _pinController,
                    readOnly: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 8.0),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
            child: SimpleNumpad(
              buttonWidth: size.width,
              buttonHeight: size.height * 0.4,
              gridSpacing: 10,
              buttonBorderRadius: 30,
              useBackspace: true,
              optionText: 'clear',
              onPressed: (str) {
                switch (str) {
                  case 'BACKSPACE':
                    // This case is accessible when you have set "useBackspace: true".
                    BlocProvider.of<SetPinBloc>(context)
                        .add(BackspacePressed());
                    break;
                  case 'clear':
                    // This string is what you have injected into "optionText".
                    BlocProvider.of<SetPinBloc>(context).add(ClearPressed());
                    break;
                  default:
                    // '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
                    BlocProvider.of<SetPinBloc>(context)
                        .add(NumPadPressed(str));
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
