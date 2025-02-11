import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/default_app_bar.dart';

class PageBase extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final bool? enableAppBar;
  final String? title;
  const PageBase(
      {super.key,
      this.body,
      this.bottomNavigationBar,
      this.actions,
      this.enableAppBar = false,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: enableAppBar == false
          ? null
          : DefaultAppBar(actions: actions ?? [], title: title),
      body: body,
      bottomNavigationBar: bottomNavigationBar != null
          ? Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bottomNavigationBar != null
                    ? [bottomNavigationBar!]
                    : [Container()],
              ),
            )
          : null,
    );
  }
}
