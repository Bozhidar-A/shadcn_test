// library defs
library shadcn_ui_example;

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

part "router.dart";
part "./consts.dart";
part "./components/ScaffoldWithNestedNavigation.dart";
part "./components/ScaffoldWithNavigationBar.dart";
part "./components/ScaffoldWithNavigationRail.dart";
part "./components/NotFoundScreen.dart";
part "./components/RootScreen.dart";
part './components/DetailsScreen.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.materialRouter(
      routerConfig: goRouter,
      title: "Flutter Demo",
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadZincColorScheme.dark(),
      ),
    );
  }
}
