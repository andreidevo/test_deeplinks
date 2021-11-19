import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_deeplinks/Screens/MainScreen/mainScreen.dart';
import 'package:flutter_test_deeplinks/cubit/main_observable.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'cubit/deeplink_cubit.dart';

Future<void> initUniLinks() async {
  try {
    final initialLink = await getInitialLink();

    if (initialLink != null && initialLink.toString() != ""){
      deepLinkCubit.openNewUri(initialLink.toString());
    }

  } on PlatformException {}

  sub = uriLinkStream.listen((Uri? uri) {
    deepLinkCubit.openNewUri(uri.toString());
  }, onError: (err) {});
}

late StreamSubscription sub;
DeepLinkCubit deepLinkCubit = DeepLinkCubit();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initUniLinks();

  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: MyBlocObserver(),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => deepLinkCubit,
        child: MainScreen(),
      ));
  }
}


