import 'package:flash_app/screens/terms_of_use/termes_of_use_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter/src/widgets/basic.dart' as basic;
import '../../repositories/gestures_repo/gestures.repo.dart';
import '../login/viewmodel/login.viewmodel.dart';
import 'flash_card/flashcard.widget.dart';
import 'viewmodel/home.viewmodel.dart';
import 'widget/background.widget.dart';
import 'widget/finish_message.widget.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeViewModel controller = GetIt.I.get<HomeViewModel>();

  final GesturesRepository gesturesRepository = GesturesRepository();

  @override
  void initState() {
    super.initState();
    autorun(
      (p0) {
        if (controller.totalViewdCards >= 1 && !controller.userWantToContinue) {
          Future.delayed(const Duration(milliseconds: 200)).then(
            (value) => showDialog(
              context: context,
              builder: (context) => const FinishDialog(),
              barrierDismissible: false,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BlinkingContainer(),
          basic.Listener(
            onPointerDown: (event) =>
                gesturesRepository.startGesture(DateTime.now(), event.position),
            onPointerMove: (event) =>
                gesturesRepository.addPointToGesture(event.position),
            onPointerUp: (event) => gesturesRepository.finishGesture(
                DateTime.now(), event.position),
            child: Scaffold(
              backgroundColor: Colors.transparent,
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
                  "Cartões aprendidos/revisados: ${controller.totalViewdCards}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),
                );
              }),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: TermsOfUseButton(),
          )
        ],
      ),
    );
  }
}
