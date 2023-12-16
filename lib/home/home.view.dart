
import 'package:flash_app/home/flash_card/flashcard.widget.dart';
import 'package:flash_app/home/viewmodel/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class Home extends StatelessWidget {
  final HomeViewModel controller = GetIt.I.get<HomeViewModel>();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      //TODO ADD EVENTS TO LISTEN
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Observer(
            builder: (context) {
              return Stack(
                children: [
                  FlashCard(
                    frontText: controller.secondCard.frontText,
                    backText: controller.secondCard.backText,
                    isTopCard: false,
                  ),
                  FlashCard(
                    frontText: controller.topCard.frontText,
                    backText: controller.topCard.backText,
                    isTopCard: true,
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
