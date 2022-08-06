import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';

class CustomScaffold extends StatelessWidget {
  final bool canPop;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomPadding;
  final bool hasBodyUnfocus;

  const CustomScaffold({
    Key? key,
    this.canPop = false,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomPadding = false,
    this.hasBodyUnfocus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => canPop,
      child: Scaffold(
        appBar: appBar,
        body: Listener(
            onPointerDown: hasBodyUnfocus
                ? (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                : null,
            child: body),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: CustomTheme.colors.white,
        resizeToAvoidBottomInset: resizeToAvoidBottomPadding,
      ),
    );
  }
}
