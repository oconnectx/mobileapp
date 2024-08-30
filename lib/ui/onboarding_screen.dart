import 'package:flutter/material.dart';
import 'package:ocx/ui/wallet_screens/mnemonic_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color secondaryColor = Theme.of(context).colorScheme.onPrimary;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ocx logo
                _logoImage(size),

                // background image
                _backgroundImage(size),
                Column(
                  children: [
                    // create wallet button
                    _createWalletButton(
                      context: context,
                      label: "Create wallet",
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),

                    // import wallet button
                    _importWalletButton(label: "Import wallet"),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  /// returns logo [Image] widget wrapped in [padding]
  _logoImage(Size size) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: SizedBox(
        width: size.width * 0.5,
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }

  /// returns background [Image] widget wrapped in [padding]
  _backgroundImage(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      child: SizedBox(
        width: size.width,
        child: Image.asset("assets/images/auth_image.png"),
      ),
    );
  }

  /// returns create wallet [TextButton] widget
  _createWalletButton({required BuildContext context, required String label}) {
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
                    builder: (context) => MnemonicView(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigoAccent[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  label,
                  style: const TextStyle(
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

  _importWalletButton({required String label}) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.indigoAccent[100]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
