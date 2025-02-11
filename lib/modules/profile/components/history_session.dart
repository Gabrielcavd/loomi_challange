import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class HistorySession extends StatelessWidget {
  const HistorySession({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("History", style: AppTextStyles.labelTextStyle(fontSize: 18)),
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                "assets/images/premium_subscription.png",
                fit: BoxFit.cover,
                height: 100,
                width: 165,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  "Film",
                  style: AppTextStyles.textStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.palleteWhite),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
