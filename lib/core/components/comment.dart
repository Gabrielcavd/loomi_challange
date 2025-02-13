import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/comment_bottom_sheet.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'John Doe',
                          style: AppTextStyles.textStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.18,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isDismissible: true,
                              builder: (context) {
                                return const CommentBottomSheet();
                              },
                            );
                          },
                          child: const Icon(
                            Icons.more_vert,
                            color: AppTheme.palleteWhite,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '2 weeks ago',
                      style: AppTextStyles.textStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.palleteWhite.shade600,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: Text(
                        'Lorem ipsum dolor sit asdfasdfasdfasjldhfklasdj',
                        style: AppTextStyles.textStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const ReplySecction(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReplySecction extends StatelessWidget {
  const ReplySecction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_drop_down_sharp,
          color: AppTheme.lightPurple,
        ),
        Text(
          'View 12 replies',
          style: AppTextStyles.textStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppTheme.lightPurple,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'REPLY',
          style: AppTextStyles.textStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.palleteWhite,
          ),
        ),
      ],
    );
  }
}
