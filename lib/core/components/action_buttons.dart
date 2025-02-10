import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/design_system/themes/app_button_styles.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons(
      {super.key, required this.onTapTopButton, required this.topButtonText});
  final void Function() onTapTopButton;
  final String topButtonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppButton(
          onPressed: onTapTopButton,
          width: 205,
          text: topButtonText,
        ),
        const SizedBox(height: 5),
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: AppButtonStyles.outlinedButtonStyle(context, 205),
          child: const Text("Back"),
        ),
      ],
    );
  }
}
