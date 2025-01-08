part of shadcn_ui_example;

//all the navigation code is from
//https://github.com/bizz84/nested_navigation_examples/blob/main/examples/gorouter/lib/main.dart
//and it's accompanying article
//https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter/

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                  label: Text(""), icon: Icon(LucideIcons.store)),
              NavigationRailDestination(
                  label: Text(""), icon: Icon(LucideIcons.camera)),
              NavigationRailDestination(
                  label: Text(""), icon: Icon(LucideIcons.circleUser)),
            ],
          ),
          // const VerticalDivider(thickness: 1, width: 1),
          // // This is the main content.
          // Expanded(
          //   child: body,
          // ),
        ],
      ),
    );
  }
}
