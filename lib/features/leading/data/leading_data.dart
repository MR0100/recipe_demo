import 'package:flutter/material.dart';
import 'package:recipe_demo/core/asset/assets.dart';
import 'package:recipe_demo/features/leading/model/leading_item_model.dart';

import '../insiders/favorites/view/favorite_screen.dart';
import '../insiders/home/view/home_screen.dart';
import '../insiders/settings/view/setting_screen.dart';
import '../insiders/shopping/view/shopping_screen.dart';

class LeadingData {
  static List<LeadingItemModel> items = [
    LeadingItemModel(
      title: 'Favorites',
      icon: AssetUtilities.homeSvg,
      index: 0,
    ),
    LeadingItemModel(
      title: 'Shopping List',
      icon: AssetUtilities.shoppingSvg,
      index: 1,
    ),
    LeadingItemModel(
      title: 'Leftovers',
      icon: AssetUtilities.leftOverSvg,
      index: 2,
    ),
    LeadingItemModel(
      title: 'Settings',
      icon: AssetUtilities.settingSvg,
      index: 3,
    ),
  ];

  static List<Widget> pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
    const ShoppingScreen(),
  ];
}
