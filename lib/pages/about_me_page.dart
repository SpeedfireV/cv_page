import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
                color: darkOrange,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                        height: 150,
                        image: AssetImage("lib/assets/images/profile.jpg"))),
                SizedBox(width: 40),
                Text(
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
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TitleText("About Me"),
                  ),
                  DescriptionText(
                    "Jestem młodym, ambitnym i pracowitym studentem telekomunikacji z nadmiarem wolnego czasu interesującym się tworzeniem aplikacji mobilnych. Przez ostatnie lata zdążyłem podjąć się pracy na Upwork oraz stworzyłem kilka aplikacji, które dały mi doświadczenie z Flutterem, Firebasem, wydawaniem aplikacji w Google Play oraz innych przydatnych umiejętności.  Chciałbym to doświadczenie przekuć w coś użytecznego i służącego innym ludziom, a także móc się przy okazji dalej rozwijać. Nie przeraża mnie, także wizja pracy w zespole, a powierzone mi zadania traktuję jako możliwość rozwoju.",
                  ),
                  MasonryGridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText("Skills"),
                          BulletedList([
                            "2-letnie doświadczenie we Flutterze (w tym znajomość bibliotek flutter_hooks, Riverpod, Hive, Freezed i innch)",
                            "Znajomość środowiska Git"
                          ])
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
