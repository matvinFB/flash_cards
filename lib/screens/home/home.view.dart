import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../repositories/gestures_repo/gestures.repo.dart';
import '../login/viewmodel/login.viewmodel.dart';
import 'flash_card/flashcard.widget.dart';
import 'viewmodel/home.viewmodel.dart';

class Home extends StatelessWidget {
  final HomeViewModel controller = GetIt.I.get<HomeViewModel>();
  final GesturesRepository gesturesRepository = GesturesRepository();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Listener(
            onPointerDown: (event) =>
                gesturesRepository.startGesture(DateTime.now(), event.position),
            onPointerMove: (event) =>
                gesturesRepository.addPointToGesture(event.position),
            onPointerUp: (event) => gesturesRepository.finishGesture(
                DateTime.now(), event.position),
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Observer(
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
                },
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 24,
            child: IconButton(
              onPressed: () {
                final loginScreenViewmodel = GetIt.I.get<LoginViewmodel>();
                loginScreenViewmodel.logout().then(
                  (value) {
                    controller.resetTotalViewdCards();
                    Navigator.of(context).pop();
                  },
                );
              },
              icon: const Icon(Icons.logout),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Observer(builder: (context) {
                return Text(
                  "Cartão aprendidos/revisados: ${controller.totalViewdCards}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
