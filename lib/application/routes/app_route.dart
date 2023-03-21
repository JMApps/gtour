import 'package:flutter/material.dart';
import 'package:gtour/pages/add_group_page.dart';
import 'package:gtour/pages/add_user_page.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'add_group_tour_page':
        return MaterialPageRoute(
          builder: (_) => const AddGroupPage(),
        );
      case 'add_users_page':
        return MaterialPageRoute(
          builder: (_) => const AddUserPage(),
        );
      default:
        throw Exception('Ошибка роута ${routeSettings.name}');
    }
  }
}
