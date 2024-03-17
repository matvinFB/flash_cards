import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';


import '../viewmodel/home.viewmodel.dart';

// ignore: must_be_immutable
class BlinkingContainer extends StatelessWidget {

  HomeViewModel flashCardsController = GetIt.I.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: double.infinity,
          width: double.infinity,
          color: flashCardsController.currentState == BackgroundState.none
              ? Colors.white
              : flashCardsController.currentState == BackgroundState.remember
                  ? const Color.fromRGBO(193, 225, 193, 1)
                  : const Color.fromRGBO(249,150,150, 1),
        );
      },
    );
  }
}
