import 'package:flash_app/screens/login/login.view.dart';
import 'package:flash_app/services/keys_service/keys.service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



import 'repositories/auth_repo/auth.repo.dart';
import 'screens/home/viewmodel/home.viewmodel.dart';
import 'screens/login/viewmodel/login.viewmodel.dart';

void main() {
  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<HomeViewModel>(HomeViewModel());

  final supabaseUrl = KeysService.getSupabaseURL();
  final supabaseClientKey = KeysService.getSupabaseClientKey();

  if (supabaseUrl != null && supabaseClientKey != null) {
    getIt.registerSingleton<SupabaseClient>(SupabaseClient(
      supabaseUrl,
      supabaseClientKey,
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
