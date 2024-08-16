import 'package:flutter/material.dart';

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
                _logoImage(size),
                _backgroundImage(size),
                Column(
                  children: [
                    _createWalletButton(label: "Create wallet"),
                    const SizedBox(
                      height: 8.0,
                    ),
                    _importWalletButton(label: "Import wallet"),
                  ],
                )
              ],
            ),
          ),
        ));
  }

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

  _backgroundImage(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      child: SizedBox(
        width: size.width,
        child: Image.asset("assets/images/auth_image.png"),
      ),
    );
  }

  _createWalletButton({required String label}) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextButton(
              onPressed: () {},
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
