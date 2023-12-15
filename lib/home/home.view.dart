import 'package:flash_app/home/flash_card/flashcard.widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      //TODO ADD EVENTS TO LISTEN
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(233, 235, 241, 1),
        body: SafeArea(
          child: Stack(
            children: [
              FlashCard(
                frontText: "Carro",
                backText: "Car",
              ),
              FlashCard(
                frontText: "Computador",
                backText: "Compiuter",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
