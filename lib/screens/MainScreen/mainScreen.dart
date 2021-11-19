import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_deeplinks/cubit/deeplink_cubit.dart';
import 'package:flutter_test_deeplinks/cubit/deeplink_state.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: BlocBuilder<DeepLinkCubit, DeepLinkState>(
            builder: (context, state){
              if (state is DeepLinkInitial){
                return Container(
                  child: Center(
                    child: Text("Waiting deepLink"),
                  ),
                );
              }
              else if (state is DeepLinkNew){
                return Container(
                  child: Center(
                    child: Text(
                    state.deepLink.pathName.toString(),
                    textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              return Container();
            }
          )
      ),
    );
  }

  void changeCity(BuildContext context, String pathName) {
    final weatherBloc = BlocProvider.of<DeepLinkCubit>(context);
    weatherBloc.openNewUri(pathName);
  }
}

