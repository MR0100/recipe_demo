import 'package:flutter/material.dart';
import 'package:recipe_demo/core/core.dart';
import 'package:recipe_demo/features/leading/data/leading_data.dart';
import 'package:recipe_demo/features/leading/provider/leading_provider.dart';

import '../../../config/config.dart';

class LeadingScreen extends StatefulWidget {
  int? index;
  LeadingScreen({this.index, super.key});

  @override
  State<LeadingScreen> createState() => _LeadingScreenState();
}

class _LeadingScreenState extends State<LeadingScreen> {
  late LeadingProvider _leadingProvider;
  @override
  void initState() {
    _leadingProvider = Provider.of<LeadingProvider>(context, listen: false);
    _leadingProvider.onInit(widget.index ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VariableUtilities.theme.lightGray,
      body: Consumer<LeadingProvider>(
        builder: (context, leadingProvider, child) {
          return PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: LeadingData.pages.length,
            controller: leadingProvider.pageController,
            itemBuilder: (context, index) => LeadingData.pages[index],
          );
        },
      ),
      bottomNavigationBar:
          Consumer<LeadingProvider>(builder: (context, leadingProvider, child) {
        return BottomNavigationBar(
          onTap: (value) {
            leadingProvider.changeIndex(value);
          },
          currentIndex: leadingProvider.selectedPageIndex,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          iconSize: 20,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 10,
          backgroundColor: VariableUtilities.theme.white,
          selectedItemColor: VariableUtilities.theme.black,
          unselectedItemColor: VariableUtilities.theme.gray,
          items: List.generate(
            LeadingData.items.length,
            (index) => BottomNavigationBarItem(
              label: LeadingData.items[index].title,
              icon: Icon(
                LeadingData.items[index].icon,
              ),
            ),
          ),
        );
      }),
    );
  }
}
