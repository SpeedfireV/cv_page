import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/pages/git_updates_page.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TitleText(
                  appLocalizations.homePageTitle,
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
              appLocalizations.homePageDescription,
              textColor: whitish,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(
                appLocalizations.myLatestGitUpdate,
                textColor: whitish,
              ),
              TextButtonWithIcon(
                text: appLocalizations.seeMore,
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
                appLocalizations.recentlyFinishedProject,
                textColor: whitish,
              ),
              TextButtonWithIcon(
                text: appLocalizations.seeMore,
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
