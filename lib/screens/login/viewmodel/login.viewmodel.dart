import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../repositories/auth_repo/auth.repo.dart';


part 'login.viewmodel.g.dart';

class LoginViewmodel = _LoginViewmodelBase with _$LoginViewmodel;

abstract class _LoginViewmodelBase with Store {
  @observable
  String _email = "";

  @action
  void updateUser(String newValue) => _email = newValue;

  @observable
  String _password = "";

  @action
  void updatePassword(String newValue) => _password = newValue;

  @observable
  bool _hidePassword = true;

  @computed
  bool get hidePassword => _hidePassword;

  @action
  void switchPasswordObscurity() => _hidePassword = !_hidePassword;

  @observable
  bool _waitingLogin = false;

  @computed
  bool get waitingLogin => _waitingLogin;

  @observable
  bool _succesfulLogin = false;

  @computed
  bool get succesfulLogin => _succesfulLogin;

  @action
  Future<bool> login() async {
    _waitingLogin = true;
    AuthRepo authRepo = GetIt.I.get<AuthRepo>();
    bool response = await authRepo.login(email: _email, password: _password);
    _waitingLogin = false;
    return response;
  }

  Future<bool> logout() async {
    _waitingLogin = true;
    AuthRepo authRepo = GetIt.I.get<AuthRepo>();
    bool response = await authRepo.login(email: _email, password: _password);
    _waitingLogin = false;
    return response;
  }
}
