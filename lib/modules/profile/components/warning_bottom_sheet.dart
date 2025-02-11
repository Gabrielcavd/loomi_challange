import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/row_action_buttons.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class WarningBottomSheet extends StatelessWidget {
  const WarningBottomSheet(
      {super.key,
      required this.onTapConfirmButton,
      required this.isButtonRequesting,
      required this.titleWarning,
      required this.descriptionWarning,
      required this.buttonText});
  final void Function() onTapConfirmButton;
  final bool isButtonRequesting;
  final String titleWarning;
  final String descriptionWarning;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.lightPurple,
                ),
              ),
              Text(
                "Warning",
                style: AppTextStyles.textStyle(
                  color: AppTheme.palleteWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 300,
            child: Text(
              titleWarning,
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle(
                color: AppTheme.palleteWhite,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: Text(
              descriptionWarning,
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle(
                color: AppTheme.palleteWhite,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 50),
          RowActionButtons(
              onTapTopButton: onTapConfirmButton,
              topButtonText: buttonText,
              isRequesting: isButtonRequesting),
        ],
      ),
    );
  }
}
