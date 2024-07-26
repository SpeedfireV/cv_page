import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../widgets.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({super.key});

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReferenceTextButton(
          label: "Github",
          iconData: IonIcons.logo_github,
          function: () {
            js.context.callMethod('open', ['https://github.com/SpeedfireV/']);
          },
        ),
        SizedBox(width: 4),
        ReferenceTextButton(
          label: "LinkedIn",
          iconData: IonIcons.logo_linkedin,
          function: () {
            js.context.callMethod('open', ['https://github.com/SpeedfireV/']);
          },
        )
      ],
    );
  }
}
