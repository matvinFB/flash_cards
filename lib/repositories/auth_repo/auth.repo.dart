import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../services/supabase/supabase.service.dart';
part 'auth.repo.g.dart';

class AuthRepo = _AuthRepoBase with _$AuthRepo;

abstract class _AuthRepoBase with Store {
  @observable
  Session? _currentSession;

  @computed
  Session? get currentSession => _currentSession;

  @observable
  User? _user;

  @computed
  User? get user => _user;

  @action
  Future<bool> login({required String email, required String password}) async{
    AuthResponse? response = await SupabaseService.login(email: email, password: password);

    if (response!=null) {
      _currentSession = response.session;
      _user = response.user;
      return true;
    }

    return false;
  }

  @action
  Future<void> logout() async{
    await SupabaseService.logout();

    return;
  }
}
