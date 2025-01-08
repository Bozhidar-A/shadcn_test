part of shadcn_ui_example;

// GoRouter configuration
// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorStoresKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellStores');
final _shellNavigatorCameraKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellCamera');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: ROUTE_URLS.stores,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: ((context, state) => const NotFoundScreen()),
  routes: [
    // Stateful nested navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorStoresKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: ROUTE_URLS.stores,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RootScreen(
                    label: ROUTE_URLS.stores,
                    detailsPath: "${ROUTE_URLS.stores}${ROUTE_URLS.details}"),
              ),
              routes: [
                // child route
                GoRoute(
                  path: ROUTE_URLS.details,
                  builder: (context, state) =>
                      const DetailsScreen(label: ROUTE_URLS.stores),
                ),
              ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCameraKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: ROUTE_URLS.camera,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RootScreen(
                    label: ROUTE_URLS.camera,
                    detailsPath: "${ROUTE_URLS.camera}${ROUTE_URLS.details}"),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: ROUTE_URLS.profile,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RootScreen(
                    label: ROUTE_URLS.profile,
                    detailsPath: "${ROUTE_URLS.profile}${ROUTE_URLS.details}"),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
