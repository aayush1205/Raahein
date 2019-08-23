import 'package:flutter/material.dart';
import 'package:raahein_final/teddy/auth.dart';

class ProviderN extends InheritedWidget {
  final BaseAuth auth;

  ProviderN({
    Key key,
    Widget child,
    this.auth,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static ProviderN of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ProviderN) as ProviderN); 
}
