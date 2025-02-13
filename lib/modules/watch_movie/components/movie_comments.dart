import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/app_text_field.dart';
import 'package:loomi_challange/core/components/comment.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/modules/watch_movie/controllers/watch_movie_controller.dart';

class CommentsDrawer extends StatelessWidget {
  const CommentsDrawer({super.key, required this.controller});
  final WatchMovieController controller;

  @override
  Widget build(BuildContext context) {
    final currentUser =
        controller.firebaseAuthService.firebaseAuth.currentUser!;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppTheme.darkGrey,
      width: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "324 Comments",
                style: AppTextStyles.textStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.palleteWhite),
              ),
              Text(
                "Close",
                style: AppTextStyles.textStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.lightPurple),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: size.height * 0.65,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const Comment();
              },
            ),
          ),
          //TODO componentizar profile
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: currentUser.photoURL!.isNotEmpty
                    ? Image.file(
                        errorBuilder: (context, error, stackTrace) =>
                            const CircleAvatar(
                          radius: 20,
                          backgroundColor: AppTheme.palleteGrey,
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                        File(currentUser.photoURL!),
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      )
                    : const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppTheme.palleteGrey,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
              ),
              SizedBox(
                height: 40,
                width: size.width * 0.3,
                child: const AppTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: "Add a reply",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
