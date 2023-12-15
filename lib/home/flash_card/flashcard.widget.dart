import 'package:flash_app/home/flash_card/flahscard.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:math' as math;

class FlashCard extends StatelessWidget {
  final String frontText;
  final String backText;
  final FlashCardViewModel controller = FlashCardViewModel();
  FlashCard({required this.frontText, required this.backText, super.key});

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
        if (controller.vericalHeight>100);
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
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: const Color.fromRGBO(211, 211, 211, 1),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
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
  }
}
