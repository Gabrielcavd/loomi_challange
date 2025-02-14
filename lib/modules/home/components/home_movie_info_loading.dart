import 'package:flutter/material.dart';
import 'package:loomi_challange/core/design_system/themes/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class HomeMovieInfoLoading extends StatelessWidget {
  const HomeMovieInfoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Widget getBaseContainer(double height, double width, {double radius = 16}) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      );
    }

    Widget mediumContainer = Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: getBaseContainer(11, 270),
    );

    return Shimmer.fromColors(
      baseColor: AppTheme.palleteWhite.shade600.withOpacity(0.2),
      highlightColor: AppTheme.palleteWhite.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getBaseContainer(10, 55),
          const SizedBox(height: 10),
          getBaseContainer(25, 105),
          const SizedBox(height: 10),
          mediumContainer,
          mediumContainer,
          mediumContainer,
          mediumContainer,
          mediumContainer,
          const SizedBox(height: 20),
          Row(
            children: [
              getBaseContainer(10, 65),
              const SizedBox(width: 5),
              getBaseContainer(10, 30),
            ],
          ),
          Row(
            children: [
              getBaseContainer(20, 20, radius: 50),
              const SizedBox(width: 5),
              getBaseContainer(10, 245, radius: 50),
            ],
          ),
          const SizedBox(height: 40),
          Center(
            child: getBaseContainer(40, 205, radius: 7),
          ),
          const SizedBox(height: 20),
          Divider(
            color: AppTheme.palleteGrey.shade700,
            thickness: 0.5,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getBaseContainer(20, 20, radius: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  getBaseContainer(10, 85, radius: 7),
                  const SizedBox(height: 5),
                  getBaseContainer(10, 75, radius: 7),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
