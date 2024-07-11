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

class SubtitleItalicText extends StatelessWidget {
  const SubtitleItalicText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(text, style: TextStyles.subtitleItalicText);
  }
}

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(text, style: TextStyles.subtitleText);
  }
}

class SmallText extends StatelessWidget {
  const SmallText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(text, style: TextStyles.smallText);
  }
}

class SmallItalicText extends StatelessWidget {
  const SmallItalicText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(text, style: TextStyles.smallItalicText);
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(text, style: TextStyles.descriptionText);
  }
}

class BulletedList extends StatelessWidget {
  const BulletedList({required this.title, required this.dataList, super.key});
  final String title;
  final List<String> dataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(alignment: Alignment.centerLeft, child: TitleText(title)),
        SizedBox(height: 4),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SelectableText("\u2022 ${dataList[index]}",
                  style: TextStyles.descriptionText);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 8,
              );
            },
            itemCount: dataList.length),
      ],
    );
  }
}

class PointedList extends StatelessWidget {
  const PointedList(
      {super.key,
      required this.name,
      required this.titles,
      required this.subtitles});
  final String name;
  final List<String> titles;
  final List<String?> subtitles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TitleText(name),
        ),
        SizedBox(height: 4),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SubtitleItalicText(titles[index])),
                  subtitles.length - 1 >= index
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: DescriptionText(subtitles[index]!))
                      : Container()
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 8,
              );
            },
            itemCount: titles.length),
      ],
    );
  }
}

class ReferenceTextButton extends StatefulWidget {
  const ReferenceTextButton(
      {super.key, required this.label, required this.iconData});
  final String label;
  final IconData iconData;

  @override
  State<ReferenceTextButton> createState() => _ReferenceTextButtonState();
}

class _ReferenceTextButtonState extends State<ReferenceTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      label: Text(widget.label, style: TextStyle(color: lightBlue)),
      icon: Icon(widget.iconData),
      style: TextButton.styleFrom(
          overlayColor: darkBlue.withOpacity(0.15),
          iconColor: lightBlue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(standardBorderRadius))),
    );
  }
}

class IconWithTooltip extends StatelessWidget {
  const IconWithTooltip(
      {super.key, required this.message, required this.iconData});
  final String message;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      richMessage: TextSpan(
          text: message,
          style: TextStyles.descriptionText.copyWith(color: white)),
      decoration:
          BoxDecoration(color: grey, borderRadius: BorderRadius.circular(5)),
      preferBelow: false,
      child: GreyIcon(iconData: iconData, size: 28),
    );
  }
}

class GreyIcon extends StatelessWidget {
  const GreyIcon({super.key, required this.iconData, this.size});
  final IconData iconData;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: grey,
    );
  }
}
