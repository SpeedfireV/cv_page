import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/constants/styles.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 320.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: whitish,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText("Projects"),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: DescriptionText(
                                "It's a page to show my progress in years!")),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          IonIcons.logo_firebase,
                          color: darkOrange,
                          size: 24,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Synchronized With Firebase",
                          style: TextStyle(
                              color: darkOrange,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: 6 / 4,
              children: [
                Card(
                  color: lightOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(standardBorderRadius)),
                  child: Text(
                    'hello',
                    style: TextStyle(color: grey),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
