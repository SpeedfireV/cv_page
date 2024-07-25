import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../widgets.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReferenceTextButton(
            label: "Github", iconData: IonIcons.logo_github),
        SizedBox(width: 4),
        ReferenceTextButton(
            label: "LinkedIn", iconData: IonIcons.logo_linkedin)
      ],
    );
  }
}
