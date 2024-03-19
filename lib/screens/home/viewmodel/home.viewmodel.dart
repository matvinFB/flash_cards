import 'package:mobx/mobx.dart';

import '../flash_card/model/flashcard.model.dart';
import 'flashcard_list.dart';
part 'home.viewmodel.g.dart';


enum BackgroundState {
  remember,
  forgot,
  none
}


class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  ObservableList<FlashCardModel> cardsList =
      ObservableList.of(ENGLISH_FLASHCARD);

  @computed
  FlashCardModel get topCard => cardsList.first;

  @computed
  FlashCardModel get secondCard => cardsList[1];

  @action
  markAsRemembered() {
    var a = cardsList.first;
    cardsList.removeAt(0);
    cardsList.insert(cardsList.length, a);
    blinkBackground(BackgroundState.remember);
  }

  @action
  markAsForgotten() {
    var a = cardsList.first;
    cardsList.removeAt(0);
    cardsList.insert(cardsList.length ~/ 5, a);
    blinkBackground(BackgroundState.forgot);
  }

  @observable
  bool _userWantToContinue = false;

  @computed
  bool get userWantToContinue => _userWantToContinue;

  @action
  void setUserWantToContinue(bool newValue) => _userWantToContinue = newValue;

  @observable
  int _topCardColorIndex = 0;

  @observable
  int _secondCardColorIndex = 1;

  @computed
  int get topCardColorIndex => _topCardColorIndex;

  @computed
  int get secondCardColorIndex => _secondCardColorIndex;

  @observable
  int _totalViewdCards = 0;

  @computed
  int get totalViewdCards => _totalViewdCards;

  @action
  int incrementTotalViewdCards() => _totalViewdCards++;

  @action
  int resetTotalViewdCards() => _totalViewdCards = 0;

  @action
  void updateColorIndex(int newIndex) {
    _topCardColorIndex = _secondCardColorIndex;
    _secondCardColorIndex = newIndex;
  }

  @observable
  BackgroundState _currentState = BackgroundState.none;

  @computed
  BackgroundState get currentState => _currentState;

  @action
  Future<void> blinkBackground(BackgroundState value) async{
    _currentState = value;
    await Future.delayed(const Duration(milliseconds: 500));
    _currentState = BackgroundState.none;
  }
  
}
