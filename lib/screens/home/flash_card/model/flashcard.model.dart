

import 'package:mobx/mobx.dart';
part 'flashcard.model.g.dart';

class FlashCardModel = _FlashCardModelBase with _$FlashCardModel;

abstract class _FlashCardModelBase with Store {
  @observable
  String frontText;
  @observable
  String backText;

  _FlashCardModelBase({required this.backText, required this.frontText});
}
