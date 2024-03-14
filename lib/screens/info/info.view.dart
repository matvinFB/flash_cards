import 'package:flash_app/screens/home/home.view.dart';
import 'package:flutter/material.dart';

import 'widgets/card.widget.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            Text(
              "Flashcard",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey.shade600),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
                text: TextSpan(
                    text: "Obrigado pro participar desse experimento! ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey.shade500,
                        fontWeight: FontWeight.w500,
                        height: 1.4),
                    children: [
                      TextSpan(
                        text:
                            "O flashcard é um app que visa coletar dados da interação do usuário com a tela. Nenhum dado que possa te identificar será coletado, fique tranquilo. Qualquer dúvida pode ser encaminhada para o seguinte email ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey.shade400,
                            fontWeight: FontWeight.w400,
                            height: 1.4),
                      ),
                      const TextSpan(
                        text: "matheusviniciusf@alu.ufc.br",
                      )
                    ]),
                textAlign: TextAlign.justify),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Como usar o App:",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey.shade600,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            const GestureCard(
              imagePath: "assets/images/eye.png",
              description:
                  "Veja a palavra em inglês e tente se lembrar da tradução",
            ),
            const SizedBox(
              height: 8,
            ),
            const GestureCard(
              imagePath: "assets/images/left_right_gestures.png",
              description:
                  "Deslize para os lados e veja o verso da carta com a resposta",
            ),
            const SizedBox(
              height: 8,
            ),
            const GestureCard(
              imagePath: "assets/images/up.png",
              description: "Deslize para cima caso tenha conseguido se lembrar",
            ),
            const SizedBox(
              height: 8,
            ),
            const GestureCard(
              imagePath: "assets/images/down.png",
              description: "Deslize para cima caso não tenha conseguido",
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(),)),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  color: Colors.blueGrey.shade600,
                ),
                child: const Center(
                  child: Text(
                    "Ir para o App",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        height: 1.4),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
