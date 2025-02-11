import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/profile/components/warning_bottom_sheet.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageBase(
        enableAppBar: true,
        title: "Subscription",
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/login_logo.png",
                width: 130,
              ),
              const SizedBox(height: 40),
              const SubscriptionAdvantage(
                  title:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
              const SubscriptionAdvantage(title: "Lorem ipsum dolor sit amet"),
              const SubscriptionAdvantage(
                  title:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
              const SubscriptionAdvantage(
                  title: "4K+ Lorem ipsum dolor sit amet"),
              const SubscriptionAdvantage(
                  title:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
              const SubscriptionAdvantage(title: "Lorem ipsum dolor sit amet"),
              const SubscriptionAdvantage(
                  title:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
              const SizedBox(height: 80),
              const PlanRenewal(),
              const SizedBox(height: 30),
              AppButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      builder: (context) {
                        return WarningBottomSheet(
                          onTapConfirmButton: () async {
                            Navigator.popUntil(
                                context, ModalRoute.withName(Routes.profile));
                          },
                          titleWarning:
                              "Are you sure you want to cancel your subscription? ",
                          descriptionWarning:
                              "Please note that cancelling your plan will immediately revoke your access to all features. If you're experiencing any issues with our app, we'd love to help you resolve them",
                          buttonText: "Terminate Plan",
                          isButtonRequesting: false,
                        );
                      },
                    );
                  },
                  width: 205,
                  text: "Terminate Plan"),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionAdvantage extends StatelessWidget {
  const SubscriptionAdvantage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: 320,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.check,
              color: AppTheme.lightPurple,
              size: 18,
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                title,
                maxLines: 2,
                style: AppTextStyles.textStyle(color: AppTheme.palleteWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanRenewal extends StatelessWidget {
  const PlanRenewal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: AppTheme.palleteGrey.shade700,
          thickness: 0.5,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Plan Renewal",
                style: AppTextStyles.headerSubtitleTextStyle(
                    color: AppTheme.palleteWhite)),
            Text(
              "Dec 12, 2023",
              style: AppTextStyles.textStyle(
                  color: AppTheme.palleteWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Divider(
          color: AppTheme.palleteGrey.shade700,
          thickness: 0.5,
        ),
      ],
    );
  }
}
