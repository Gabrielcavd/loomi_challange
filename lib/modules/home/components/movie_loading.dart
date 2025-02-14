// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MovieLoading extends StatefulWidget {
  const MovieLoading({super.key});

  @override
  _MovieLoadingState createState() => _MovieLoadingState();
}

class _MovieLoadingState extends State<MovieLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: width,
          height: height * 0.77,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, _controller.value, 1.0],
              colors: const [
                Color.fromARGB(255, 122, 121, 124),
                Color.fromARGB(255, 104, 89, 120),
                Color.fromARGB(255, 85, 55, 115),
              ],
            ),
          ),
        );
      },
    );
  }
}
