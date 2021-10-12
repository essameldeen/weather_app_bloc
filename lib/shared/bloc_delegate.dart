import 'package:flutter_bloc/flutter_bloc.dart';

// for now what is bloc  and what is Transition now
class AppBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(
        "bloc from Transation ${bloc.toString()} \n transation :${transition.toString()}");
  }
}
