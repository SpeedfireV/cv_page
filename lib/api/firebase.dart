import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_page_new/models/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../firebase_options.dart';

class FirebaseService {
  static Future initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<List<FirebaseProject>?> getProjects() async {
    // SENTRY ERROR
    // try {
    //   1/0;
    // } catch (exception, stackTrace) {
    //   await Sentry.captureException(
    //     exception,
    //     stackTrace: stackTrace,
    //   );
    // }
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection("projects").get().then((event) {
      List<FirebaseProject> projects = [];
      for (var doc in event.docs) {
        print("Firebase data:" +doc.data().keys.toString());
        print("From Json: ${(FirebaseProject.fromJson(doc.data())).toString()}");
       projects.add(FirebaseProject.fromJson(doc.data()));
      }
      return projects;
    }).onError((error, errorStacktrace) {
      throw errorStacktrace;
    });
    return null;
  }
}
