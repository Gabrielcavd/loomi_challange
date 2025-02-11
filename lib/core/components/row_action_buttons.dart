import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/design_system/themes/app_button_styles.dart';

class RowActionButtons extends StatelessWidget {
  const RowActionButtons(
      {super.key,
      required this.onTapTopButton,
      required this.topButtonText,
      required this.isRequesting});
  final void Function() onTapTopButton;
  final String topButtonText;
  final bool isRequesting;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: AppButtonStyles.outlinedButtonStyle(context, 160),
          child: const Text("Cancel"),
        ),
        const SizedBox(width: 5),
        AppButton(
          isRequesting: isRequesting,
          onPressed: onTapTopButton,
          width: 160,
          text: topButtonText,
        ),
      ],
    );
  }
}
