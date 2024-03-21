import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';


import '../viewmodel/home.viewmodel.dart';

// ignore: must_be_immutable
class BlinkingContainer extends StatelessWidget {

  final HomeViewModel flashCardsController = GetIt.I.get<HomeViewModel>();

  BlinkingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: flashCardsController.currentBackgroundState == BackgroundState.none ?  Curves.easeIn : Curves.easeOut,
          onEnd: () => flashCardsController.setCurrentBackgroundState(BackgroundState.none),
          height: double.infinity,
          width: double.infinity,
          color: flashCardsController.currentBackgroundState == BackgroundState.none
              ? Colors.white
              : flashCardsController.currentBackgroundState == BackgroundState.remember
                  ? const Color.fromRGBO(193, 225, 193, 1)
                  : const Color.fromRGBO(249,150,150, 1),
        );
      },
    );
  }
}
