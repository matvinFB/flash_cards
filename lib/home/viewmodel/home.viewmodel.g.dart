// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  Computed<FlashCardModel>? _$topCardComputed;

  @override
  FlashCardModel get topCard =>
      (_$topCardComputed ??= Computed<FlashCardModel>(() => super.topCard,
              name: '_HomeViewModelBase.topCard'))
          .value;
  Computed<FlashCardModel>? _$secondCardComputed;

  @override
  FlashCardModel get secondCard =>
      (_$secondCardComputed ??= Computed<FlashCardModel>(() => super.secondCard,
              name: '_HomeViewModelBase.secondCard'))
          .value;
  Computed<int>? _$topCardColorIndexComputed;

  @override
  int get topCardColorIndex => (_$topCardColorIndexComputed ??= Computed<int>(
          () => super.topCardColorIndex,
          name: '_HomeViewModelBase.topCardColorIndex'))
      .value;
  Computed<int>? _$secondCardColorIndexComputed;

  @override
  int get secondCardColorIndex => (_$secondCardColorIndexComputed ??=
          Computed<int>(() => super.secondCardColorIndex,
              name: '_HomeViewModelBase.secondCardColorIndex'))
      .value;

  late final _$cardsListAtom =
      Atom(name: '_HomeViewModelBase.cardsList', context: context);

  @override
  ObservableList<FlashCardModel> get cardsList {
    _$cardsListAtom.reportRead();
    return super.cardsList;
  }

  @override
  set cardsList(ObservableList<FlashCardModel> value) {
    _$cardsListAtom.reportWrite(value, super.cardsList, () {
      super.cardsList = value;
    });
  }

  late final _$_topCardColorIndexAtom =
      Atom(name: '_HomeViewModelBase._topCardColorIndex', context: context);

  @override
  int get _topCardColorIndex {
    _$_topCardColorIndexAtom.reportRead();
    return super._topCardColorIndex;
  }

  @override
  set _topCardColorIndex(int value) {
    _$_topCardColorIndexAtom.reportWrite(value, super._topCardColorIndex, () {
      super._topCardColorIndex = value;
    });
  }

  late final _$_secondCardColorIndexAtom =
      Atom(name: '_HomeViewModelBase._secondCardColorIndex', context: context);

  @override
  int get _secondCardColorIndex {
    _$_secondCardColorIndexAtom.reportRead();
    return super._secondCardColorIndex;
  }

  @override
  set _secondCardColorIndex(int value) {
    _$_secondCardColorIndexAtom.reportWrite(value, super._secondCardColorIndex,
        () {
      super._secondCardColorIndex = value;
    });
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  dynamic markAsRemembered() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.markAsRemembered');
    try {
      return super.markAsRemembered();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic markAsForgotten() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.markAsForgotten');
    try {
      return super.markAsForgotten();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateColorIndex(int newIndex) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.updateColorIndex');
    try {
      return super.updateColorIndex(newIndex);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardsList: ${cardsList},
topCard: ${topCard},
secondCard: ${secondCard},
topCardColorIndex: ${topCardColorIndex},
secondCardColorIndex: ${secondCardColorIndex}
    ''';
  }
}
