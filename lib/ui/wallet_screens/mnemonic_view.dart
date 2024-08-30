import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocx/bloc/setpin/bloc.dart';
import 'package:ocx/ui/set_pin.dart';
import 'package:ocx/utils/colors.dart';

class MnemonicView extends StatelessWidget {
  MnemonicView({super.key});

  final List<String> mnemonic = [
    "Wrap",
    "lays",
    "out",
    "each",
    "and",
    "attempts",
    "place",
    "adjacent",
    "previous",
    "child",
    "main",
    "axis",
    "given",
    "direction",
    "leaving",
    "spacing",
    "space",
    "between",
    "libraries",
    "love",
    "chains",
    "disguise",
    "intruder",
    "sentence",
  ];

  @override
  Widget build(BuildContext context) {
    // get screen size
    Size size = MediaQuery.of(context).size;

    //return scaffold
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            /// on press navigate to previous screen
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text("Create Wallet"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.copy_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Store your phrase in a safe place if you lose access to your app it will be required to restore your wallet.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0),
            ),
          ),

          ///words [Gridview]
          Expanded(
            child: GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: mnemonic.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  mainAxisExtent: 35.0),
              itemBuilder: (context, int idx) {
                return _wordContainer(idx: idx, word: mnemonic[idx]);
              },
            ),
          ),

          // continue button
          _continueButton(context),
          const SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }

  /// returns a [TextButton] wrapped in a row and padding
  _continueButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SetPinBloc(),
                      child: SetPin(),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigoAccent[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// word container returns a word wrapped in a [Container]
  /// takes a [int] idx and a [String] word
  _wordContainer({required int idx, required String word}) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor?.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${idx + 1}. $word",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
