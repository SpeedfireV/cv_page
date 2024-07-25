import 'package:cv_page_new/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatefulWidget {
  const AppBarButton(
      {super.key,
      this.iconData,
      required this.text,
      required this.active,
      required this.function});
  final IconData? iconData;
  final String text;
  final bool active;
  final Function() function;

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  @override
  Widget build(BuildContext context) {
    Color fontColor = widget.active ? white : lightBlue;
    return Material(
      borderRadius: BorderRadius.circular(5),
      color: widget.active ? darkOrange : transparent,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.active ? darkOrange : transparent),
        child: InkWell(
          overlayColor: widget.active
              ? WidgetStatePropertyAll(lightOrange.withOpacity(0.5))
              : WidgetStatePropertyAll(darkBlue.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(5),
          onTap: widget.function,
          onHover: (value) {
            debugPrint("Hovered App Bar Button");
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: [
                widget.iconData != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          widget.iconData,
                          color: fontColor,
                          size: 24,
                        ),
                      )
                    : Container(),
                Text(
                  widget.text,
                  style: TextStyle(
                      color: fontColor,
                      fontWeight:
                          widget.active ? FontWeight.w600 : FontWeight.w500,
                      fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
