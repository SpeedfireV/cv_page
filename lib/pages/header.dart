import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

import '../app_bar_widgets.dart';
import '../constants/colors.dart';
import '../widgets.dart';

class Header extends StatefulWidget {
  const Header(this.navigationShell, {super.key});
  final StatefulNavigationShell navigationShell;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var _currentTime = DateFormat.Hms().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    _currentTime,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: lightBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                ),
                RowWithPadding(
                  mainAxisAlignment: MainAxisAlignment.end,
                  elementsPadding: 24,
                  verticalPadding: 10,
                  widgets: [
                    AppBarButton(
                      text: "Home",
                      iconData: IonIcons.home,
                      active: widget.navigationShell.currentIndex == 0,
                      function: () {
                        widget.navigationShell.goBranch(0);
                      },
                    ),
                    AppBarButton(
                        text: "Projects",
                        iconData: IonIcons.easel,
                        active: widget.navigationShell.currentIndex == 1,
                        function: () {
                          widget.navigationShell.goBranch(1);
                        }),
                    AppBarButton(
                        text: "About Me",
                        iconData: IonIcons.person,
                        active: widget.navigationShell.currentIndex == 2,
                        function: () {
                          widget.navigationShell.goBranch(2);
                        }),
                    AppBarButton(
                        text: "Experience & Skills",
                        iconData: IonIcons.bar_chart,
                        active: widget.navigationShell.currentIndex == 3,
                        function: () {
                          widget.navigationShell.goBranch(3);
                        }),
                    AppBarButton(
                        text: "Git Updates",
                        iconData: IonIcons.logo_github,
                        active: widget.navigationShell.currentIndex == 4,
                        function: () {
                          widget.navigationShell.goBranch(4);
                        }),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: white,
            height: 10,
          ),
          widget.navigationShell,
        ],
      ),
    );
  }
}
