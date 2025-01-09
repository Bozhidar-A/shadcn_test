// library defs
library shadcn_ui_example;

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:solidart/solidart.dart';
import 'dart:convert';

part "./state.dart";
part "router.dart";
part "./consts.dart";
part "./util.dart";
part "./components/ScaffoldWithNestedNavigation.dart";
part "./components/ScaffoldWithNavigationBar.dart";
part "./components/ScaffoldWithNavigationRail.dart";
part "screens/NotFoundScreen.dart";
part "screens/RootScreen.dart";
part 'screens/DetailsScreen.dart';
part "screens/RegisterScreen.dart";
part "screens/LoginScreen.dart";
part "screens/ScannerScreen.dart";

void main() async {
  await dotenv.load(fileName: ".env");
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client
      .setEndpoint('https://appwrite.musaka.top/v1')
      .setProject('677eb824000be2c73500')
      .setSelfSigned(
          status:
              true); // For self signed certificates, only use for development
  Account account = Account(client);

  accountService.value = account;

  runApp(MyApp(account: account));
}

class MyApp extends StatelessWidget {
  final Account account;

  const MyApp({super.key, required this.account});

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
