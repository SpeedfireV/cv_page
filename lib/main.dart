import 'package:cv_page_new/api/firebase.dart';
import 'package:cv_page_new/app_bar_widgets.dart';
import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/pages/git_updates_page.dart';
import 'package:cv_page_new/pages/projects_page.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future main() async {
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://72719afceaf43b616e18683b8ed85041@o4507629393870848.ingest.us.sentry.io/4507658881925120';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },

    appRunner: () => runApp(MyApp()),
  );
  await dotenv.load(fileName: ".env");

  FirebaseService.initializeFirebase();
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
              const ProjectsPage(),
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
