import 'package:cv_page_new/api/github.dart';
import 'package:cv_page_new/app_bar_widgets.dart';
import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/pages/git_updates_page.dart';
import 'package:cv_page_new/pages/projects_page.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var currentTime = DateFormat.Hms().format(DateTime.now());
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          useMaterial3: true,
        ),
        home: Scaffold(
          backgroundColor: Color(0xff11151C),
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        child: Text(
                          currentTime,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: lightBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
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
                          active: false,
                        ),
                        AppBarButton(
                          text: "Projects",
                          iconData: IonIcons.easel,
                          active: false,
                        ),
                        AppBarButton(
                          text: "About Me",
                          iconData: IonIcons.person,
                          active: true,
                        ),
                        AppBarButton(
                          text: "Experience & Skills",
                          iconData: IonIcons.bar_chart,
                          active: false,
                        ),
                        AppBarButton(
                          text: "Git Updates",
                          iconData: IonIcons.logo_github,
                          active: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: white,
                height: 10,
              ),
              // PAGE
              const GitUpdatesPage(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReferenceTextButton(
                      label: "Github", iconData: IonIcons.logo_github),
                  SizedBox(width: 4),
                  ReferenceTextButton(
                      label: "LinkedIn", iconData: IonIcons.logo_linkedin)
                ],
              )
            ],
          ),
        ));
  }
}
