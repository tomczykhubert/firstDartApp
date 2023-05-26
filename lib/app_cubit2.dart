import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit2 extends Cubit<AppState2> {
  AppCubit2() : super(const AppState2('0'));
  String output = AppCubit2().output;
  void changeOutput(a) {
    if (output == "0") {
      emit(AppState2(a.toString()));
    } else {
      emit(AppState2(output += a.toString()));
    }
  }
}

class AppState2 {
  final String output;
  const AppState2(this.output);
}
