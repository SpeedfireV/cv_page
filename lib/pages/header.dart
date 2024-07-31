import 'package:cv_page_new/bloc/clock_bloc.dart';
import 'package:cv_page_new/bloc/clock_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../app_bar_widgets.dart';
import '../constants/colors.dart';
import '../widgets.dart';
import 'footer.dart';

class Header extends StatefulWidget {
  const Header(this.navigationShell, {super.key});
  final StatefulNavigationShell navigationShell;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
        backgroundColor: darkGrey,
        body: FooterView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: BlocProvider(
                    create: (context) => ClockBloc(),
                    child: BlocBuilder<ClockBloc, ClockState>(
                      builder: (context, state) {
                        return Text(
                          state.formattedTime,
                          style: TextStyle(
                              color: lightBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        );
                      },
                    ),
                  )),
                  RowWithPadding(
                    mainAxisAlignment: MainAxisAlignment.end,
                    elementsPadding: 24,
                    verticalPadding: 10,
                    widgets: [
                      AppBarButton(
                        text: appLocalizations.homeButton,
                        iconData: IonIcons.home,
                        active: widget.navigationShell.currentIndex == 0,
                        function: () {
                          widget.navigationShell.goBranch(0);
                        },
                      ),
                      AppBarButton(
                          text: appLocalizations.projectsButton,
                          iconData: IonIcons.easel,
                          active: widget.navigationShell.currentIndex == 1,
                          function: () {
                            widget.navigationShell.goBranch(1);
                          }),
                      AppBarButton(
                          text: appLocalizations.aboutMeButton,
                          iconData: IonIcons.person,
                          active: widget.navigationShell.currentIndex == 2,
                          function: () {
                            widget.navigationShell.goBranch(2);
                          }),
                      // AppBarButton(
                      //     text: "Experience & Skills",
                      //     iconData: IonIcons.bar_chart,
                      //     active: widget.navigationShell.currentIndex == 3,
                      //     function: () {
                      //       widget.navigationShell.goBranch(3);
                      //     }),
                      AppBarButton(
                          text: appLocalizations.gitUpdates,
                          iconData: IonIcons.logo_github,
                          active: widget.navigationShell.currentIndex == 3,
                          function: () {
                            widget.navigationShell.goBranch(3);
                          }),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: whitish,
              height: 10,
            ),
            SizedBox(height: 8),
            widget.navigationShell
          ],
          footer: Footer(backgroundColor: darkGrey, child: CustomFooter()),
          flex: 2,
        ));
  }
}
