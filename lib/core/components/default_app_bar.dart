import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar(
      {super.key, required this.actions, this.title, this.centerTitle = true})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  final List<Widget> actions;
  final String? title;
  final bool centerTitle;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      actions: actions,
      centerTitle: centerTitle,
      title: title != null
          ? Text(
              title!,
              style: AppTextStyles.textStyle(
                color: AppTheme.palleteWhite,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            )
          : null,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppTheme.lightPurple,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
