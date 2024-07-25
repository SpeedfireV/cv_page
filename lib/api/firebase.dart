import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_page_new/models/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../firebase_options.dart';
import 'dart:developer';
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
    List<FirebaseProject> projects =  await db.collection("projects").get().then((event) {
      List<FirebaseProject> projects = [];
      for (var doc in event.docs) {
        FirebaseProject project = FirebaseProject.fromJson(doc.data());
        projects.add(project);
      }
      return projects;
    }).onError((error, errorStacktrace) {
      throw errorStacktrace;
    });
    return projects;
  }
}
