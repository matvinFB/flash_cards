import 'package:flash_app/services/keys_service/keys.service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home/home.view.dart';
import 'home/viewmodel/home.viewmodel.dart';
import 'login/login.view.dart';
import 'login/viewmodel/login.viewmodel.dart';
import 'repositories/auth_repo/auth.repo.dart';

void main() {
  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<HomeViewModel>(HomeViewModel());

  final SUPABASE_URL = KeysService.getSupabaseURL();
  final SUPABASE_CLIENT_KEY = KeysService.getSupabaseClientKey();

  if (SUPABASE_URL != null && SUPABASE_CLIENT_KEY != null) {
    getIt.registerSingleton<SupabaseClient>(SupabaseClient(
      SUPABASE_URL,
      SUPABASE_CLIENT_KEY,
    ));
    getIt.registerLazySingleton<LoginViewmodel>(() => LoginViewmodel());
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
    
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Card App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade600),
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.blueGrey.shade200,
        selectionHandleColor: Colors.black,
        ),
        

      ),
      home: const LoginScreen()
    );
  }
}
