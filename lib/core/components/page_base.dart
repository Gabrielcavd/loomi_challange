import 'package:flutter/material.dart';
import 'package:loomi_challange/core/components/default_app_bar.dart';

class PageBase extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final bool? enableAppBar;
  final String? title;
  final bool extendBody;
  final bool centerTitle;
  final Widget? endDrawer;
  final GlobalKey? scaffoldKey;
  final bool? resizeToAvoidBottomInset;

  const PageBase(
      {super.key,
      this.body,
      this.bottomNavigationBar,
      this.actions,
      this.enableAppBar = false,
      this.title,
      this.extendBody = false,
      this.centerTitle = true,
      this.endDrawer,
      this.scaffoldKey,
      this.resizeToAvoidBottomInset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: enableAppBar == false
          ? null
          : DefaultAppBar(
              actions: actions ?? [],
              title: title,
              centerTitle: centerTitle,
            ),
      body: body,
      endDrawer: endDrawer,
      extendBodyBehindAppBar: extendBody,
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
