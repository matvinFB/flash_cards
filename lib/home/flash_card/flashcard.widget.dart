import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'dart:math' as math;

import '../viewmodel/home.viewmodel.dart';
import 'viewmodel/flahscard.viewmodel.dart';

class FlashCard extends StatelessWidget {
  final String frontText;
  final String backText;
  final bool isTopCard;
  final FlashCardViewModel controller = FlashCardViewModel();
  final HomeViewModel viewModelController = GetIt.I.get<HomeViewModel>();
  FlashCard(
      {required this.frontText,
      required this.backText,
      required this.isTopCard,
      super.key});

  final List<Color> cardColors = [
    const Color(0xFFC2E5F2),
    const Color(0xffD0EFF4),
    const Color(0xffE0F7FE),
    const Color(0xFFC6F4E3),
    const Color(0xFFBDF2D8),
    const Color(0xFFADEDBF),
  ];

  void pickNewCardColor() {
    int newIndex;
    do {
      newIndex = Random().nextInt(cardColors.length);
    } while (newIndex == viewModelController.secondCardColorIndex);
    viewModelController.updateColorIndex(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) =>
          controller.incrementHorizontalAngle(details.delta.dx),
      onHorizontalDragEnd: (details) => controller.setHorizontalAngle(
          controller.horizontalAngle > 90 && controller.horizontalAngle < 270
              ? 180
              : 0),
      onVerticalDragUpdate: (details) {
        controller.incrementVerticaltalAngle(details.delta.dy);
        controller.incrementVerticaltalHeight(details.delta.dy);
      },
      onVerticalDragEnd: (details) {
        if (controller.vericalHeight > 200 && controller.vericalHeight > 0) {
          viewModelController.markAsForgotten();
          pickNewCardColor();
        }
        if (controller.vericalHeight < -200 && controller.vericalHeight < 0) {
          viewModelController.markAsRemembered();
          pickNewCardColor();
        }
        controller.setVerticallAngle(0);
        controller.setVerticaltalHeight(0);
      },
      child: Observer(builder: (context) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0002)
            ..rotateY(controller.horizontalAngle * math.pi / 180)
            ..rotateX(controller.vericallAngle * math.pi / 180)
            ..translate(0.0, controller.vericalHeight, 0.0),
          alignment: Alignment.center,
          child: Observer(builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: cardColors[isTopCard
                    ? viewModelController.topCardColorIndex
                    : viewModelController.secondCardColorIndex],
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 207, 207, 207),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: cardColors[isTopCard
                        ? viewModelController.topCardColorIndex
                        : viewModelController.secondCardColorIndex],
                    border: Border.all(width: 5, color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Transform.flip(
                    flipX: controller.isFlipped,
                    child: Text(
                      controller.isFlipped ? backText : frontText,
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
