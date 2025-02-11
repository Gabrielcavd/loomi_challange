import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class PageHeader extends StatelessWidget {
  const PageHeader(
      {super.key,
      required this.title,
      required this.subTitle,
      this.limitSubTitleWidth = true,
      this.limitTitleWidth = false});
  final String title;
  final String subTitle;
  final bool limitSubTitleWidth;
  final bool limitTitleWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/small_logo.png",
          width: 32,
        ),
        const SizedBox(height: 50),
        SizedBox(
          width: limitTitleWidth ? 205 : null,
          child: Text(
            title,
            style: AppTextStyles.headerTitleTextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: limitSubTitleWidth ? 295 : null,
          child: Text(
            subTitle,
            style: AppTextStyles.textStyle(
              color: AppTheme.darkGrey2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
