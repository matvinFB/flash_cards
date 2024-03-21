import 'package:flutter/material.dart';

import 'terms_of_use.constat.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "TCLE",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(69, 90, 100, 1),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text(
            termsOfUse,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(69, 90, 100, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: const Color.fromRGBO(224, 224, 224, 1), width: 1),
                color: const Color.fromRGBO(84, 110, 122, 1),
              ),
              child: const Center(
                child: Text(
                  "Voltar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
