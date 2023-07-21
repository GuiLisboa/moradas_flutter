import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    // Aqui você pode adicionar a lógica que deseja executar quando uma rota é removida
    if (previousRoute != null) {}
  }
}
