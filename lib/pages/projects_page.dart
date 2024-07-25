import 'package:cv_page_new/api/firebase.dart';
import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/constants/styles.dart';
import 'package:cv_page_new/models/firebase.dart';
import 'package:cv_page_new/utils/date_formatter.dart';
import 'package:cv_page_new/utils/text_formatter.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:material_symbols_icons/symbols.dart';

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
          SizedBox(
              width: double.infinity,
              child: PageInformationCard(
                title: "Projects",
                subtitle: "It's a page to show my progress in years!",
                suffixIcon: IonIcons.logo_firebase,
                suffixIconColor: darkOrange,
                suffixText: "Synchronized With Firebase",
              )),
          FutureBuilder(future: FirebaseService.getProjects(), builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.done) {

              return GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 6/4),
                itemCount: snapshot.data != null ? snapshot.data!.length : 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProjectCard(project: snapshot.data![index],);
                  });

            } else {
              return CircularProgressIndicator();
            }
          }),

        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});
  final FirebaseProject project;



  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {

    return Card(
      color: lightOrange,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(standardBorderRadius)),
      child: InkWell(
        borderRadius: BorderRadius.circular(standardBorderRadius),
        onTap: () {
          debugPrint("Card clicked");
        },
        hoverColor: hoverOrange,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        widget.project.title,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GreyIcon(iconData: IonIcons.analytics),
                          SizedBox(width: 4),
                          DescriptionText(widget.project.status),
                        ],
                      ),
                    ],
                  ),
                  DescriptionText(durationDate(widget.project.initDate!, widget.project.endDate))
                ],
              ),
              SizedBox(height: 16),
              DescriptionText(
                  widget.project.description),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmallItalicText("For"),
                  DescriptionText(platformsToString(widget.project.platforms))
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SmallItalicText("Made With"),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconWithTooltip(
                          message: "Firebase",
                          iconData: IonIcons.logo_firebase),
                      SizedBox(width: 8),
                      IconWithTooltip(
                          message: "Figma", iconData: IonIcons.logo_figma),
                      SizedBox(width: 8),
                      IconWithTooltip(
                          message: "Flutter", iconData: Symbols.flutter)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
