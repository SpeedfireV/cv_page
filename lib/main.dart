import 'package:cv_page_new/api/firebase.dart';
import 'package:cv_page_new/app_bar_widgets.dart';
import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/pages/git_updates_page.dart';
import 'package:cv_page_new/pages/home_page.dart';
import 'package:cv_page_new/pages/projects_page.dart';
import 'package:cv_page_new/router.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseService.initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {



    return MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          useMaterial3: true,
        ),
        routerConfig: router,
      );
  }
}
