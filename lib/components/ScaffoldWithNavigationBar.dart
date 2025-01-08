part of shadcn_ui_example;

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
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
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: '', icon: Icon(LucideIcons.store)),
          NavigationDestination(label: '', icon: Icon(LucideIcons.camera)),
          NavigationDestination(label: '', icon: Icon(LucideIcons.circleUser)),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
