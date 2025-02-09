import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/default_app_bar.dart';

class PageBase extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final bool? enableAppBar;
  const PageBase(
      {super.key,
      this.body,
      this.bottomNavigationBar,
      this.actions,
      this.enableAppBar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          enableAppBar == false ? null : DefaultAppBar(actions: actions ?? []),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
