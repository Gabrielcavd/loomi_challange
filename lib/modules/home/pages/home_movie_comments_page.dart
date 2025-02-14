import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/app_text_field.dart';
import 'package:loomi_challange/core/components/comment.dart';
import 'package:loomi_challange/core/components/page_base.dart';
import 'package:loomi_challange/core/components/profile_image.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';

class HomeMovieCommentsPage extends StatelessWidget {
  const HomeMovieCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController controller =
        getDependency.get<HomeController>(context);
    return SafeArea(
      top: false,
      child: PageBase(
        enableAppBar: true,
        centerTitle: false,
        resizeToAvoidBottomInset: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "324 Comments",
              style: AppTextStyles.textStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.palleteWhite),
            ),
          ),
        ],
        title: 'Comments',
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: size.height * 0.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Comment(
                      commentWidth: size.width * 0.75,
                      commentAcitonWidth: size.width * 0.54,
                    );
                  },
                ),
              ),
              const Spacer(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileImage(photoURL: controller.user!.photoURL!),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: size.width * 0.75,
                    child: const AppTextField(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: "Add a reply",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
