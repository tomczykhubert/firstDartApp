import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState('Tap counter: 0'));
  int counter = 0;
  bool notifications = false;
  void changeText() {
    counter++;
    emit(AppState("Tap counter: $counter"));
  }
}

class AppState {
  const AppState(this.abc);
  final String abc;
}

// class AppCubit2 extends Cubit<AppState2> {
//   AppCubit2() : super(const AppState2(Icons.notification_add));
//   int counter = 0;
//   bool notifications = false;
//   void changeNotificationIcon() {
//     if (notifications) {
//       emit(const AppState2(Icons.notifications_active));
//     } else {
//       emit(const AppState2(Icons.notification_add));
//     }
//     notifications = !notifications;
//   }
// }

// class AppState2 {
//   const AppState2(this.icon);
//   final IconData icon;
// }
