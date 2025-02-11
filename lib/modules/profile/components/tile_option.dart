import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class TileOption extends StatelessWidget {
  const TileOption(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final Widget icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppTheme.palleteGrey2.shade900,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyles.textStyle(
                  color: AppTheme.palleteWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w200),
            ),
            const Spacer(),
            Icon(
              size: 18,
              Icons.arrow_forward_ios,
              color: AppTheme.palleteGrey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
