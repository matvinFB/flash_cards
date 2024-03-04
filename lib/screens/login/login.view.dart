import 'package:flash_app/screens/info/info.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../home/home.view.dart';
import 'viewmodel/login.viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginScreenViewmodel = GetIt.I.get<LoginViewmodel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            Text(
              "Flashcards",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey.shade600),
            ),
            const Spacer(),
            SizedBox(
              height: 60.0,
              width: double.infinity,
              child: TextField(
                onChanged: (value) => loginScreenViewmodel.updateUser(value),
                decoration: InputDecoration(
                  label: const Text("Email"),
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Observer(builder: (context) {
              return SizedBox(
                height: 60.0,
                width: double.infinity,
                child: TextField(
                    onChanged: (value) =>
                        loginScreenViewmodel.updatePassword(value),
                    obscureText: loginScreenViewmodel.hidePassword,
                    decoration: InputDecoration(
                      label: const Text("Senha"),
                      labelStyle: const TextStyle(color: Colors.black),
                      suffix: IconButton(
                        onPressed: loginScreenViewmodel.switchPasswordObscurity,
                        icon: Icon(
                          loginScreenViewmodel.hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )),
              );
            }),
            const SizedBox(
              height: 16,
            ),
            Observer(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    loginScreenViewmodel.login().then(
                      (value) {
                        if (value) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => InfoScreen(),
                            ),
                          );
                        }
                      },
                    );
                  },
                  icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: loginScreenViewmodel.waitingLogin
                        ? const CircularProgressIndicator(
                            color: Colors.blueGrey,
                          )
                        : const Icon(
                            Icons.login,
                            color: Colors.black,
                            size: 24,
                          ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
