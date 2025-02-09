import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key,
      required this.child,
      required this.backgroundColor,
      required this.onTap});
  final Widget child;
  final Color backgroundColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: child,
      ),
    );
  }
}
