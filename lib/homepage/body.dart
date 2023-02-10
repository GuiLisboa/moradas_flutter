import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  desenharTituloCartao(
      IconData iconeDaEsquerda, String titulo, Color corDoIcone) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconeDaEsquerda,
                color: corDoIcone,
                size: 30,
              ),
              Text(titulo,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: CartaoPadrao(
              cartaoFilho: desenharTituloCartao(
                  Icons.notifications, 'Avisos', Colors.grey),
            ))
          ],
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: CartaoPadrao(
              cartaoFilho: desenharTituloCartao(
                  Icons.real_estate_agent, 'Reservas', Colors.green),
            ))
          ],
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: CartaoPadrao(
              cartaoFilho: desenharTituloCartao(
                  Icons.report_problem, 'Ocorrencias', Colors.redAccent),
            ))
          ],
        )),
      ],
    );
  }
}

class CartaoPadrao extends StatelessWidget {
  CartaoPadrao({this.cartaoFilho});

  final Widget? cartaoFilho;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white54,
      ),
      child: cartaoFilho,
    );
  }
}
