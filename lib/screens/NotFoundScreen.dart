part of shadcn_ui_example;

/// Widget for the root/initial pages in the bottom navigation bar.
class NotFoundScreen extends StatelessWidget {
  /// Creates a RootScreen
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     '404 - Page not found',
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Whoops! Something went wrong.",
                textAlign: TextAlign.center,
                style: ShadTheme.of(context).textTheme.h1Large),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () => context.go(ROUTE_URLS.stores),
              child: const Text("Lets go back home."),
            ),
          ],
        ),
      ),
    );
  }
}
