

import 'package:bloc/bloc.dart';
import 'package:flutter_test_deeplinks/cubit/deeplink_state.dart';
import 'package:flutter_test_deeplinks/data/DeepLink.dart';



class DeepLinkCubit extends Cubit<DeepLinkState> {
  DeepLinkCubit() : super(DeepLinkInitial());


  void openNewUri(String newUri){
    emit(DeepLinkNew(DeepLink(pathName: newUri)));
  }

  @override
  void onChange(Change<DeepLinkState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

}