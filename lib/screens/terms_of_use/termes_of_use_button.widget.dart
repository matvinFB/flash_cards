import 'package:flutter/material.dart';

import 'terms_of_use.view.dart';

class TermsOfUseButton extends StatelessWidget {
  const TermsOfUseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TermsOfUse(),
        ),
      ),
      child: const Text(
        "Termos de uso",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
