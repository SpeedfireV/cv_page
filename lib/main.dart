import 'package:cv_page_new/app_bar_widgets.dart';
import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/pages/about_me_page.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
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
                          text: "HOME",
                          active: false,
                        ),
                        AppBarButton(
                          text: "Projects",
                          iconData: Icons.production_quantity_limits,
                          active: false,
                        ),
                        AppBarButton(
                          text: "About Me",
                          iconData: Icons.person,
                          active: true,
                        ),
                        AppBarButton(
                          text: "Experience & Skills",
                          iconData: Icons.production_quantity_limits,
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
              const AboutMePage()
            ],
          ),
        ));
  }
}
