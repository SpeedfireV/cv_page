import 'package:cv_page_new/constants/colors.dart';
import 'package:cv_page_new/constants/styles.dart';
import 'package:flutter/material.dart';

class RowWithPadding extends StatefulWidget {
  const RowWithPadding(
      {super.key,
      required this.elementsPadding,
      this.verticalPadding,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      required this.widgets});
  final double elementsPadding;
  final double? verticalPadding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final List<Widget> widgets;

  @override
  State<RowWithPadding> createState() => _RowWithPaddingState();
}

class _RowWithPaddingState extends State<RowWithPadding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.verticalPadding ?? 0),
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment:
            widget.crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < widget.widgets.length; i++)
            i == 0
                ? widget.widgets[i]
                : Row(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(width: widget.elementsPadding),
                    widget.widgets[i]
                  ])
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(text, style: TextStyles.titleText);
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
        "Jestem młodym, ambitnym i pracowitym studentem telekomunikacji z nadmiarem wolnego czasu interesującym się tworzeniem aplikacji mobilnych. Przez ostatnie lata zdążyłem podjąć się pracy na Upwork oraz stworzyłem kilka aplikacji, które dały mi doświadczenie z Flutterem, Firebasem, wydawaniem aplikacji w Google Play oraz innych przydatnych umiejętności.  Chciałbym to doświadczenie przekuć w coś użytecznego i służącego innym ludziom, a także móc się przy okazji dalej rozwijać. Nie przeraża mnie, także wizja pracy w zespole, a powierzone mi zadania traktuję jako możliwość rozwoju.",
        style: TextStyles.descriptionText);
  }
}

class BulletedList extends StatelessWidget {
  const BulletedList(this.dataList, {super.key});
  final List<String> dataList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Text("\u2022 ${dataList[index]}",
              style: TextStyles.descriptionText);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 4,
          );
        },
        itemCount: dataList.length);
  }
}
