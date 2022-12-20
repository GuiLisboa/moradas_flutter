import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  desenharColunaNoCartao(IconData iconeDaEsquerda) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                iconeDaEsquerda,
                size: 30,
                color: Colors.green,
              ),
              Text("Reservas"),
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
              cartaoFilho: desenharColunaNoCartao(Icons.real_estate_agent),
            ))
          ],
        )),
        Expanded(
            child: Row(
          children: [Expanded(child: CartaoPadrao())],
        )),
        Expanded(
            child: Row(
          children: [Expanded(child: CartaoPadrao())],
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
