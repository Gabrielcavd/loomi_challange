import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class SubscriptionsSession extends StatelessWidget {
  const SubscriptionsSession({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Subscriptions",
            style: AppTextStyles.labelTextStyle(fontSize: 18)),
        const SizedBox(height: 5),
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            height: 82,
            padding: const EdgeInsets.only(left: 5, right: 25),
            decoration: BoxDecoration(
              color: AppTheme.palleteGrey2.shade900,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/premium_subscription.png",
                  fit: BoxFit.cover,
                  width: 68,
                  height: 68,
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "STREAM Premium",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.textStyle(
                          color: AppTheme.palleteWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Jan 22, 2023",
                      style: AppTextStyles.textStyle(
                          color: AppTheme.palleteGrey.shade400, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                Text("Comming soon",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.textStyle(
                        color: AppTheme.lightPurple, fontSize: 12)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
