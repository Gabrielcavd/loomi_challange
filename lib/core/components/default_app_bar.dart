import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key, required this.actions})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  final List<Widget> actions;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      actions: actions,
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
