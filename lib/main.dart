import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transmedia/injections/dependency_injection.dart';
import 'package:transmedia/presentation/navigation/navigation.dart';
import 'package:transmedia/presentation/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  await DependencyInjection.init();
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
