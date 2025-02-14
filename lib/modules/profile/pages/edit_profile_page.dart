import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/components/app_button.dart';
import 'package:loomi_challange/core/components/app_text_field.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/components/pick_image_bottom_modal.dart';
import 'package:loomi_challange/core/components/upload_image.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/modules/profile/controllers/edit_profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileController controller =
        getDependency.get<EditProfileController>(context);
    final user = controller.user;
    return SafeArea(
      child: PageBase(
        enableAppBar: true,
        bottomNavigationBar: Obx(
          () => AppButton(
            isRequesting: controller.state.value == EditProfileState.loading,
            onPressed: () async {
              await controller.editProfile(context);
            },
            width: 205,
            text: "Update profile",
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 85,
                child: Text("Edit Profile",
                    style: AppTextStyles.headerTitleTextStyle(
                        fontSize: 26, color: AppTheme.palleteWhite)),
              ),
              const SizedBox(height: 30),
              Obx(
                () => UploadImageComponent(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return PickImageBottomSheet(
                          onTapPhoto: () {
                            controller.pickImage();
                          },
                          onTapGallery: () {
                            controller.pickFile(
                              allowedExtensions: ['jpg', 'png', 'gif'],
                            );
                          },
                        );
                      },
                    );
                  },
                  mainAxisAlignment: MainAxisAlignment.start,
                  imagePath: controller.userImage.isEmpty
                      ? user?.photoURL
                      : controller.userImage.first.path,
                ),
              ),
              const SizedBox(height: 30),
              AppTextField(
                shineBorder: true,
                controller: controller.userNameController,
                hintText: user?.displayName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
