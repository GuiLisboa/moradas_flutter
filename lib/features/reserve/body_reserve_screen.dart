// import 'package:moradas/features/homePage/body_homepage.dart';
// import 'package:flutter/material.dart';

// class BodyReserveScreen extends StatelessWidget {
//   const BodyReserveScreen({super.key});

//   desenharTituloCartao(IconData iconeDaEsquerda, Color corDoIcone,
//       String titulo, String taxaUso, String capacidade) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(
//                   iconeDaEsquerda,
//                   color: corDoIcone,
//                   size: 30,
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   titulo,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   taxaUso,
//                   style: TextStyle(fontSize: 18, color: Color(0xFF6CA8F1)),
//                 ),
//                 Text(
//                   capacidade,
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Color(0xFF6CA8F1),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   size: 30,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: CartaoPadrao(
//             cartaoFilho: desenharTituloCartao(
//                 Icons.celebration,
//                 Color(4284513675),
//                 'Salão de Festas',
//                 'Taxa de Uso: R\$ 100,00',
//                 'Capacidade: 100 pessoas'),
//           ),
//         ),
//         Expanded(
//           child: CartaoPadrao(),
//         ),
//         Expanded(
//           child: CartaoPadrao(),
//         ),
//         Expanded(
//           child: CartaoPadrao(),
//         ),
//         Expanded(
//           child: CartaoPadrao(),
//         ),
//       ],
//     );
//   }
// }
