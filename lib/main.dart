// library defs
library shadcn_ui_example;

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:go_router/go_router.dart';

part "router.dart";
part "home.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.materialRouter(
      routerConfig: _router,
      title: "Flutter Demo",
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadZincColorScheme.dark(),
      ),
    );
    return ShadApp.material(
      title: "Flutter Demo",
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadZincColorScheme.dark(),
      ),
      // materialThemeBuilder: (context, theme) {
      //   return theme.copyWith(
      //     appBarTheme: const AppBarTheme(toolbarHeight: 52),
      //   );
      // },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // TRY THIS: Try running your application with "flutter run". You'll see
    //     // the application has a purple toolbar. Then, without quitting the app,
    //     // try changing the seedColor in the colorScheme below to Colors.green
    //     // and then invoke "hot reload" (save your changes or press the "hot
    //     // reload" button in a Flutter-supported IDE, or press "r" if you used
    //     // the command line to start the app).
    //     //
    //     // Notice that the counter didn't reset back to zero; the application
    //     // state is not lost during the reload. To reset the state, use hot
    //     // restart instead.
    //     //
    //     // This works for code too, not just values: Most code changes can be
    //     // tested with just a hot reload.
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}
