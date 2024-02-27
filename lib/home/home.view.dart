import 'package:flash_app/home/flash_card/flashcard.widget.dart';
import 'package:flash_app/home/viewmodel/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../repositories/gestures_repo/gestures.repo.dart';

class Home extends StatelessWidget {
  final HomeViewModel controller = GetIt.I.get<HomeViewModel>();
  final GesturesRepository gesturesRepository = GesturesRepository();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => gesturesRepository.startGesture(DateTime.now(), event.position),
      onPointerMove: (event) => gesturesRepository.addPointToGesture(event.position),
      onPointerUp: (event) => gesturesRepository.finishGesture(DateTime.now(), event.position),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Observer(builder: (context) {
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
          }),
        ),
      ),
    );
  }
}
