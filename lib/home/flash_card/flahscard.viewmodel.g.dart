// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flahscard.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FlashCardViewModel on _FlashCardViewModelBase, Store {
  Computed<double>? _$horizontalAngleComputed;

  @override
  double get horizontalAngle => (_$horizontalAngleComputed ??= Computed<double>(
          () => super.horizontalAngle,
          name: '_FlashCardViewModelBase.horizontalAngle'))
      .value;
  Computed<bool>? _$isFlippedComputed;

  @override
  bool get isFlipped =>
      (_$isFlippedComputed ??= Computed<bool>(() => super.isFlipped,
              name: '_FlashCardViewModelBase.isFlipped'))
          .value;
  Computed<double>? _$vericallAngleComputed;

  @override
  double get vericallAngle =>
      (_$vericallAngleComputed ??= Computed<double>(() => super.vericallAngle,
              name: '_FlashCardViewModelBase.vericallAngle'))
          .value;
  Computed<double>? _$vericalHeightComputed;

  @override
  double get vericalHeight =>
      (_$vericalHeightComputed ??= Computed<double>(() => super.vericalHeight,
              name: '_FlashCardViewModelBase.vericalHeight'))
          .value;

  late final _$_horizontalAngleAtom =
      Atom(name: '_FlashCardViewModelBase._horizontalAngle', context: context);

  @override
  double get _horizontalAngle {
    _$_horizontalAngleAtom.reportRead();
    return super._horizontalAngle;
  }

  @override
  set _horizontalAngle(double value) {
    _$_horizontalAngleAtom.reportWrite(value, super._horizontalAngle, () {
      super._horizontalAngle = value;
    });
  }

  late final _$_verticalAngleAtom =
      Atom(name: '_FlashCardViewModelBase._verticalAngle', context: context);

  @override
  double get _verticalAngle {
    _$_verticalAngleAtom.reportRead();
    return super._verticalAngle;
  }

  @override
  set _verticalAngle(double value) {
    _$_verticalAngleAtom.reportWrite(value, super._verticalAngle, () {
      super._verticalAngle = value;
    });
  }

  late final _$_verticalHeightAtom =
      Atom(name: '_FlashCardViewModelBase._verticalHeight', context: context);

  @override
  double get _verticalHeight {
    _$_verticalHeightAtom.reportRead();
    return super._verticalHeight;
  }

  @override
  set _verticalHeight(double value) {
    _$_verticalHeightAtom.reportWrite(value, super._verticalHeight, () {
      super._verticalHeight = value;
    });
  }

  late final _$_FlashCardViewModelBaseActionController =
      ActionController(name: '_FlashCardViewModelBase', context: context);

  @override
  void incrementHorizontalAngle(double delta) {
    final _$actionInfo = _$_FlashCardViewModelBaseActionController.startAction(
        name: '_FlashCardViewModelBase.incrementHorizontalAngle');
    try {
      return super.incrementHorizontalAngle(delta);
    } finally {
      _$_FlashCardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHorizontalAngle(double newAngle) {
    final _$actionInfo = _$_FlashCardViewModelBaseActionController.startAction(
        name: '_FlashCardViewModelBase.setHorizontalAngle');
    try {
      return super.setHorizontalAngle(newAngle);
    } finally {
      _$_FlashCardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementVerticaltalAngle(double delta) {
    final _$actionInfo = _$_FlashCardViewModelBaseActionController.startAction(
        name: '_FlashCardViewModelBase.incrementVerticaltalAngle');
    try {
      return super.incrementVerticaltalAngle(delta);
    } finally {
      _$_FlashCardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVerticallAngle(double newAngle) {
    final _$actionInfo = _$_FlashCardViewModelBaseActionController.startAction(
        name: '_FlashCardViewModelBase.setVerticallAngle');
    try {
      return super.setVerticallAngle(newAngle);
    } finally {
      _$_FlashCardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementVerticaltalHeight(double delta) {
    final _$actionInfo = _$_FlashCardViewModelBaseActionController.startAction(
        name: '_FlashCardViewModelBase.incrementVerticaltalHeight');
    try {
      return super.incrementVerticaltalHeight(delta);
    } finally {
      _$_FlashCardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
horizontalAngle: ${horizontalAngle},
isFlipped: ${isFlipped},
vericallAngle: ${vericallAngle},
vericalHeight: ${vericalHeight}
    ''';
  }
}
