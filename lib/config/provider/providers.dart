import 'package:provider/provider.dart';
import 'package:recipe_demo/features/leading/provider/leading_provider.dart';

import '../../features/users/provider/user_provider.dart';

/// This class manage all the provider and return list of provider.
class Providers {
  /// This is the list of providers to manage and attache with application.
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
    ),
    ChangeNotifierProvider<LeadingProvider>(
      create: (_) => LeadingProvider(),
    ),
  ];
}
