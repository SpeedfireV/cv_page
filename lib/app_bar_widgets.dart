import 'package:cv_page_new/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatefulWidget {
  const AppBarButton(
      {super.key, this.iconData, required this.text, required this.active});
  final IconData? iconData;
  final String text;
  final bool active;

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
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
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
