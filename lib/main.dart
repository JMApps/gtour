import 'package:flutter/cupertino.dart';
import 'package:gtour/application/state/groups_state.dart';
import 'package:gtour/application/state/users_state.dart';
import 'package:gtour/pages/root_page.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersState(),
        ),
        ChangeNotifierProvider(
          create: (_) => GroupsState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
