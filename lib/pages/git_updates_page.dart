import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class GitUpdatesPage extends StatefulWidget {
  const GitUpdatesPage({super.key});

  @override
  State<GitUpdatesPage> createState() => _GitUpdatesPageState();
}

class _GitUpdatesPageState extends State<GitUpdatesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Flexible(
            child: SizedBox(
              width: 300,
              height: 90,
              child: Card(
                color: lightOrange,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleText("fiz-symulacja"),
                      SizedBox(width: 16),
                      VerticalDivider(
                        color: whitish,
                      ),
                      DescriptionText(
                          "Input from file & better optimalization "),
                      Expanded(child: Container()),
                      Icon(
                        IonIcons.time,
                        color: grey,
                      ),
                      SizedBox(width: 8),
                      DescriptionText("07.11.2024")
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Card(
              color: lightBlue,
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
        ],
      ),
    );
  }
}
