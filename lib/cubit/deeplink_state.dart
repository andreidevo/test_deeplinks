import 'package:flutter/cupertino.dart';
import 'package:flutter_test_deeplinks/data/DeepLink.dart';

@immutable
abstract class DeepLinkState {
  const DeepLinkState();
}

class DeepLinkInitial extends DeepLinkState {
  const DeepLinkInitial();
}

class DeepLinkNew extends DeepLinkState {
  final DeepLink deepLink;
  const DeepLinkNew(this.deepLink);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DeepLinkNew && o.deepLink == deepLink;
  }

  @override
  int get hashCode => deepLink.hashCode;
}