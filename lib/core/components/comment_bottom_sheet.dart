import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 330,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
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
                "Comment",
                style: AppTextStyles.textStyle(
                  color: AppTheme.palleteWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          const CommentBottomOption(
              icon: Icon(Icons.edit_outlined), title: "Edit"),
          const CommentBottomOption(
              icon: Icon(Icons.delete_outline_outlined), title: "Delete"),
          const CommentBottomOption(
              icon: Icon(
                Icons.flag_outlined,
                color: AppTheme.lightPurple,
              ),
              titleColor: AppTheme.lightPurple,
              title: "Report"),
        ],
      ),
    );
  }
}

class CommentBottomOption extends StatelessWidget {
  const CommentBottomOption(
      {super.key, required this.icon, required this.title, this.titleColor});
  final Icon icon;
  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            title,
            style: AppTextStyles.textStyle(
              color: titleColor ?? AppTheme.palleteWhite,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
