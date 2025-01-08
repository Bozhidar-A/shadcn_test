part of shadcn_ui_example;

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(
        title: "bruh",
      ),
    ),
  ],
);
