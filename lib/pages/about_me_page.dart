import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/constants/styles.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 320.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: darkOrange,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(standardBorderRadius))),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(standardBorderRadius),
                    child: const Image(
                        height: 150,
                        image: AssetImage("lib/assets/images/profile.jpg"))),
                SizedBox(width: 40),
                SelectableText(
                  "Grzegorz Niespodziany",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.w800, fontSize: 39),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: lightOrange,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(standardBorderRadius))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                        TitleText(AppLocalizations.of(context)!.aboutMeAboutMe),
                  ),
                  DescriptionText(
                      AppLocalizations.of(context)!.aboutMeDescription),
                  SizedBox(height: 16),
                  MasonryGridView.builder(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return index % 2 == 0
                          ? BulletedList(
                              title: AppLocalizations.of(context)!.skills,
                              dataList: [
                                  "2-letnie doświadczenie we Flutterze (w tym znajomość bibliotek flutter_hooks, Riverpod, Hive, Freezed i innch)",
                                  "Znajomość środowiska Git"
                                ])
                          : PointedList(
                              name: AppLocalizations.of(context)!.education,
                              titles: [
                                  "Politechnika Warszawska",
                                  "Członkostwo w kole naukowym Smart City PW"
                                ],
                              subtitles: [
                                  "Telekomunikacja - I Rok, II. Semestr\n11.2023 - Obecnie",
                                  "11.2023 - Obecnie"
                                ]);
                    },
                  ),
                  SizedBox(height: 24),
                  Center(
                      child: Text(
                    "Wyrażam zgodę na przetwarzanie moich danych osobowych dla potrzeb niezbędnych do realizacji procesu rekrutacji (zgodnie z ustawą z dnia 10 maja 2018 roku o ochronie danych osobowych (Dz. Ustaw z 2018, poz. 1000) oraz zgodnie z Rozporządzeniem Parlamentu Europejskiego i Rady (UE) 2016/679 z dnia 27 kwietnia 2016 r. w sprawie ochrony osób fizycznych w związku z przetwarzaniem danych osobowych i w sprawie swobodnego przepływu takich danych oraz uchylenia dyrektywy 95/46/WE (RODO).",
                    textAlign: TextAlign.center,
                    style: TextStyles.commentText,
                  )),
                  SizedBox(height: 16)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
