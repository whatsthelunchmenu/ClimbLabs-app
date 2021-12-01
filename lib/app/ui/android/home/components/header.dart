import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Text('ClimbLabs', style: headerTextStyle),
    );
  }
}
