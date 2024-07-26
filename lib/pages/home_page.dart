import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/pages/git_updates_page.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TitleText(
                  "Nice To See You Here!",
                  textColor: whitish,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: DescriptionText(
              "Look around and if you are interested you are free to contact me at:\n grzegorz.niespodziany@gmail.com or 506620208",
              textColor: whitish,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(
                "My Latest Git Update",
                textColor: whitish,
              ),
              TextButtonWithIcon(
                text: "See More",
                iconData: Icons.arrow_forward_ios,
                iconSize: 16,
                primaryColor: whitish,
                function: () => GoRouter.of(context).goNamed("gitUpdates"),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: GitUpdateCard(
                projectNameText: "projectNameText",
                gitCommitText: "gitCommitText",
                publicationDateText: "publicationDateText",
                even: true),
          ),
          SizedBox(height: 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(
                "Recently Finished Project",
                textColor: whitish,
              ),
              TextButtonWithIcon(
                text: "See More Projects",
                iconData: Icons.arrow_forward_ios,
                iconSize: 16,
                primaryColor: whitish,
                function: () => GoRouter.of(context).goNamed("gitUpdates"),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: GitUpdateCard(
                projectNameText: "projectNameText",
                gitCommitText: "gitCommitText",
                publicationDateText: "publicationDateText",
                even: true),
          ),
        ],
      ),
    );
  }
}
