import 'package:flutter/widgets.dart';

enum ViewState {
  Idle,
  Busy,
}

class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
