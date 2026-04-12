import 'package:flutter/material.dart';
import 'package:nutriq/core/presentation/utils/breakpoints.dart';
import 'package:nutriq/core/presentation/widgets/add_item_bottom_sheet.dart';
import 'package:nutriq/core/presentation/widgets/home_appbar.dart';
import 'package:nutriq/core/presentation/widgets/main_appbar.dart';
import 'package:nutriq/features/diary/diary_page.dart';
import 'package:nutriq/features/home/home_page.dart';
import 'package:nutriq/features/profile/profile_page.dart';
import 'package:nutriq/generated/l10n.dart';

class AdaptiveScaffold extends StatefulWidget {
  const AdaptiveScaffold({super.key});

  @override
  State<AdaptiveScaffold> createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  int _selectedIndex = 0;

  static const List<IconData> _selectedIcons = [
    Icons.home,
    Icons.book,
    Icons.account_circle,
  ];

  static const List<IconData> _unselectedIcons = [
    Icons.home_outlined,
    Icons.book_outlined,
    Icons.account_circle_outlined,
  ];

  late List<Widget> _bodyPages;
  late List<PreferredSizeWidget> _appbarPages;
  late List<String> _labels;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _labels = [
      S.of(context).homeLabel,
      S.of(context).diaryLabel,
      S.of(context).profileLabel,
    ];
    _bodyPages = const [
      HomePage(),
      DiaryPage(),
      ProfilePage(),
    ];
    _appbarPages = [
      const HomeAppbar(),
      MainAppbar(title: S.of(context).diaryLabel, iconData: Icons.book),
      MainAppbar(
          title: S.of(context).profileLabel, iconData: Icons.account_circle),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final layoutType = Breakpoints.getLayoutType(width);

    final scaffold = Scaffold(
      appBar: _appbarPages[_selectedIndex],
      body: _bodyPages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () => _onFabPressed(context),
              tooltip: S.of(context).addLabel,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar:
          layoutType == LayoutType.mobile ? _buildBottomNavigationBar() : null,
    );

    if (layoutType == LayoutType.tablet) {
      return Row(
        children: [
          _buildNavigationRail(),
          Expanded(child: scaffold),
        ],
      );
    }

    return scaffold;
  }

  NavigationBar _buildBottomNavigationBar() {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _setPage,
      destinations: List.generate(_labels.length, (i) {
        return NavigationDestination(
          icon: Icon(_unselectedIcons[i]),
          selectedIcon: Icon(_selectedIcons[i]),
          label: _labels[i],
        );
      }),
    );
  }

  NavigationRail _buildNavigationRail() {
    final width = MediaQuery.sizeOf(context).width;
    final extended = width >= Breakpoints.tablet;
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _setPage,
      extended: extended,
      leading: extended
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                S.of(context).appTitle,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            )
          : null,
      destinations: List.generate(_labels.length, (i) {
        return NavigationRailDestination(
          icon: Icon(_unselectedIcons[i]),
          selectedIcon: Icon(_selectedIcons[i]),
          label: Text(_labels[i]),
        );
      }),
    );
  }

  void _setPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0))),
        builder: (BuildContext context) {
          return AddItemBottomSheet(day: DateTime.now());
        });
  }
}
