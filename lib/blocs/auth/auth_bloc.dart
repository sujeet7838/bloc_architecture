import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 1));
      if (event.email == "test@test.com" && event.password == "123456") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid credentials"));
      }
    });

    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(AuthSuccess()); // Assume success
    });
  }
}
