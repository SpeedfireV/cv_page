import 'package:cv_page_new/pages/about_me_page.dart';
import 'package:cv_page_new/pages/git_updates_page.dart';
import 'package:cv_page_new/pages/header.dart';
import 'package:cv_page_new/pages/home_page.dart';
import 'package:cv_page_new/pages/projects_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router =
    GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/', routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Header(navigationShell);
      },
      branches: [
        StatefulShellBranch(navigatorKey: _sectionNavigatorKey, routes: [
          GoRoute(
            name: 'homePage',
            // Optional, add name to your routes. Allows you navigate by name instead of path
            path: '/',
            builder: (context, state) => HomePage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              name: "projects",
              path: '/project',
              builder: (context, state) => ProjectsPage()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              name: "aboutMe",
              path: '/about_me',
              builder: (context, state) => AboutMePage()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              name: "gitUpdates",
              path: '/git_updates',
              builder: (context, state) => GitUpdatesPage())
        ])
      ])
]);
