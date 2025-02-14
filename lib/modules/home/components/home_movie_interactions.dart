import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challange/core/data/domain/entities/movie.dart';
import 'package:loomi_challange/core/design_system/themes/app_text_styles.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:loomi_challange/core/design_system/themes/custom_icons.dart';
import 'package:loomi_challange/core/general_functions/get_formatted_date.dart';
import 'package:loomi_challange/core/resolve_dependences/resolve_dependences.dart';
import 'package:loomi_challange/modules/home/controllers/home_controller.dart';
import 'package:share_plus/share_plus.dart';

class MovieInteract extends StatelessWidget {
  const MovieInteract({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final controller = getDependency.get<HomeController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTapUp: (details) {
              final offset = details.globalPosition;
              showMenu(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 300,
                ),
                position: RelativeRect.fromLTRB(
                  offset.dx,
                  offset.dy - 50,
                  MediaQuery.of(context).size.width - offset.dx,
                  MediaQuery.of(context).size.height - offset.dy,
                ),
                items: [
                  PopupMenuItem(
                    onTap: null,
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IteractionIcon(
                              onTap: () {
                                controller.likeMovie();
                              },
                              title: "I like it",
                              icon: controller.likeIcon.value),
                          IteractionIcon(
                              onTap: () {
                                controller.dislikeMovie();
                              },
                              title: "It's not for me",
                              icon: controller.dislikeIcon.value),
                          IteractionIcon(
                              onTap: () {
                                controller.loveMovie();
                              },
                              title: "I love it!",
                              icon: controller.loveIcon.value),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            child: IteractionIcon(
              title: "Rate",
              icon: CustomIcons.like(),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              Share.share(
                  'Check out this movie: ${movie.name} - ${movie.synopsis}');
            },
            child: IteractionIcon(
              title: "Gift to someone",
              icon: CustomIcons.send(),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                "Avaliable until",
                style: AppTextStyles.textStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.palleteWhite),
              ),
              Text(
                getFormattedDate(movie.endDate),
                style: AppTextStyles.textStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.lightPurple),
              )
            ],
          )
        ],
      ),
    );
  }
}

class IteractionIcon extends StatelessWidget {
  const IteractionIcon(
      {super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final Widget icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          children: [
            icon,
            Text(
              title,
              style: AppTextStyles.textStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.palleteWhite),
            ),
          ],
        ),
      ),
    );
  }
}
