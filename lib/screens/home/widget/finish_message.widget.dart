import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../login/viewmodel/login.viewmodel.dart';
import '../viewmodel/home.viewmodel.dart';

class FinishDialog extends StatelessWidget {
  const FinishDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: Column(children: [
              Text(
                "Obrigado!",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 22,
                    color: Colors.blueGrey.shade700,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Você concluiu a meta de 100 cartões! Isso já é suficiente para a coleta de dados. Entretanto, se você quiser pode continuar e ver todas as cartas.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    color: Colors.blueGrey.shade600,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {
                        final loginScreenViewmodel =
                            GetIt.I.get<LoginViewmodel>();
                        final HomeViewModel controller =
                            GetIt.I.get<HomeViewModel>();
                        loginScreenViewmodel.logout().then(
                          (value) {
                            controller.resetTotalViewdCards();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Sair",
                        style: TextStyle(
                            color: Colors.blueGrey.shade700,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: 130,
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {
                        final HomeViewModel controller =
                            GetIt.I.get<HomeViewModel>();
                        controller.setUserWantToContinue(true);
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade700),
                      child: const Text(
                        "Continuar",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
