// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FlashCardModel on _FlashCardModelBase, Store {
  late final _$frontTextAtom =
      Atom(name: '_FlashCardModelBase.frontText', context: context);

  @override
  String get frontText {
    _$frontTextAtom.reportRead();
    return super.frontText;
  }

  @override
  set frontText(String value) {
    _$frontTextAtom.reportWrite(value, super.frontText, () {
      super.frontText = value;
    });
  }

  late final _$backTextAtom =
      Atom(name: '_FlashCardModelBase.backText', context: context);

  @override
  String get backText {
    _$backTextAtom.reportRead();
    return super.backText;
  }

  @override
  set backText(String value) {
    _$backTextAtom.reportWrite(value, super.backText, () {
      super.backText = value;
    });
  }

  @override
  String toString() {
    return '''
frontText: ${frontText},
backText: ${backText}
    ''';
  }
}
