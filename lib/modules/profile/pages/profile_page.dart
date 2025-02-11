import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/design_system/themes/app_button_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';
import 'package:loomi_challange/core/routes/app_routes.dart';
import 'package:loomi_challange/modules/profile/components/warning_bottom_sheet.dart';
import 'package:loomi_challange/modules/profile/components/history_session.dart';
import 'package:loomi_challange/modules/profile/components/subscriptions_session.dart';
import 'package:loomi_challange/modules/profile/components/tile_option.dart';
import 'package:loomi_challange/modules/profile/components/user_profile.dart';
import 'package:loomi_challange/modules/profile/controllers/profile_controller.dart';

import '../../../core/resolve_dependences/resolve_dependences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final ProfileController controller =
        getDependency.get<ProfileController>(context);
    return SafeArea(
      child: PageBase(
        enableAppBar: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: OutlinedButton(
              style: AppButtonStyles.outlinedButtonStyle(context, 100,
                  borderColor: AppTheme.purplePrimary.shade900,
                  borderRadius: 20),
              onPressed: () {
                Navigator.pushNamed(
                        context, "${Routes.profile}${Routes.editProfile}")
                    .then(
                  (_) {
                    setState(() {
                      controller.onInit();
                    });
                  },
                );
              },
              child: const Text("Edit Profile"),
            ),
          ),
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfile(
                photoURL: controller.user?.photoURL,
                displayName: controller.user?.displayName,
              ),
              const SizedBox(height: 30),
              TileOption(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    builder: (context) {
                      return Obx(
                        () => WarningBottomSheet(
                          onTapConfirmButton: () async {
                            await controller.deleteAccount(context);
                          },
                          titleWarning:
                              "Are you sure you want to delete your account?",
                          descriptionWarning:
                              "This action is irreversible and all of your data will be permanently deleted. If you're having any issues with our app, we'd love to help you resolve them.",
                          buttonText: "Delete Account",
                          isButtonRequesting:
                              controller.state.value == ProfileState.loading,
                        ),
                      );
                    },
                  );
                },
                title: "Delete my account",
                icon: CustomIcons.trash(
                  height: 18,
                  width: 18,
                ),
              ),
              const SizedBox(height: 10),
              TileOption(
                onTap: () {},
                title: "Change Password",
                icon: CustomIcons.shield(
                  height: 18,
                  width: 18,
                ),
              ),
              const SizedBox(height: 30),
              SubscriptionsSession(
                onTap: () {
                  Navigator.pushNamed(
                      context, "${Routes.profile}${Routes.seeSubscription}");
                },
              ),
              const SizedBox(height: 30),
              const HistorySession(),
              const SizedBox(height: 30),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    controller.signOut(context);
                  },
                  style: AppButtonStyles.outlinedButtonStyle(context, 110,
                      borderRadius: 20,
                      borderColor: AppTheme.palleteGrey.shade400),
                  child: Text(
                    "Log Out",
                    style: AppTextStyles.textStyle(
                      color: AppTheme.palleteWhite,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
