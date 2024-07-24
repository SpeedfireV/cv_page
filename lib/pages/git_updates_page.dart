import 'dart:convert';

import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/functions.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../api/github.dart';
import '../utils/date_formatter.dart';

class GitUpdatesPage extends StatefulWidget {
  const GitUpdatesPage({super.key});

  @override
  State<GitUpdatesPage> createState() => _GitUpdatesPageState();
}

class _GitUpdatesPageState extends State<GitUpdatesPage> {
  var githubService = GitHubService(username: "speedfirev");
  //TODO: https://api.github.com/repos/speedfirev/cv_page/commits

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          PageInformationCard(
              title: "Git Updates",
              subtitle: "It's a page to show my git commit history!",
              suffixIcon: IonIcons.logo_github,
              suffixIconColor: grey,
              suffixText: "Synchronized With Github",
              suffixTextColor: grey),
          FutureBuilder(
              future: githubService.fetchEvents(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Iterable<Map<String, dynamic>> repos = snapshot.data;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> repoInfo = repos.elementAt(index);
                        return GitUpdateCard(
                          projectNameText: repoInfo["repo"]["name"],
                          gitCommitText: repoInfo["payload"]["commits"][0]
                              ["message"],
                          publicationDateText:
                              formatDate(repoInfo["created_at"]),
                          even: isEven(index),
                        );
                      },
                      itemCount: repos.length);
                }
                return Text(
                  "Not Yet",
                  style: TextStyle(color: Colors.white),
                );
              }),
        ],
      ),
    );
  }
}

class GitUpdateCard extends StatefulWidget {
  const GitUpdateCard(
      {super.key,
      required this.projectNameText,
      required this.gitCommitText,
      required this.publicationDateText,
      required this.even});
  final String projectNameText;
  final String gitCommitText;
  final String publicationDateText;
  final bool even;

  @override
  State<GitUpdateCard> createState() => _GitUpdateCardState();
}

class _GitUpdateCardState extends State<GitUpdateCard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: 300,
        height: 90,
        child: Card(
          color: widget.even ? lightOrange : lightBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleText(widget.projectNameText),
                SizedBox(width: 16),
                VerticalDivider(
                  color: whitish,
                ),
                DescriptionText(widget.gitCommitText),
                Expanded(child: Container()),
                Icon(
                  IonIcons.time,
                  color: grey,
                ),
                SizedBox(width: 8),
                DescriptionText(widget.publicationDateText)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
