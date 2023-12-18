import 'package:mobx/mobx.dart';

part 'flahscard.viewmodel.g.dart';

class FlashCardViewModel = _FlashCardViewModelBase with _$FlashCardViewModel;

abstract class _FlashCardViewModelBase with Store {
  @observable
  double _horizontalAngle = 0;

  @computed
  double get horizontalAngle => _horizontalAngle;

  @computed
  bool get isFlipped => _horizontalAngle > 90 && _horizontalAngle < 270;

  @action
  void incrementHorizontalAngle(double delta) {
    _horizontalAngle = (_horizontalAngle - delta) % 360;
  }

  @action
  void setHorizontalAngle(double newAngle) => _horizontalAngle = newAngle;

  @observable
  double _verticalAngle = 0;

  @computed
  double get verticalAngle => _verticalAngle;

  double _easeDelta(double delta) {
    double easeVal = (1 + (0.45 * _verticalAngle).abs());
    return delta / (easeVal == 0 ? 1 : easeVal);
  }

  @action
  void incrementVerticalAngle(double delta) =>
      _verticalAngle += _easeDelta(delta);

  @action
  void setVerticalAngle(double newAngle) => _verticalAngle = newAngle;

  @observable
  double _verticalHeight = 0;

  @computed
  double get verticalHeight => _verticalHeight;

  @action
  void incrementVerticalHeight(double delta) {
    _verticalHeight += delta;
  }

  @action
  void setVerticalHeight(double newHeight) => _verticalHeight = newHeight;
}
