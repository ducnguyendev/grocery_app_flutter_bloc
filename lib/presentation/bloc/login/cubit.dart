import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/domain/entity/request/signin_request.dart';
import 'package:grocery_app/domain/usecase/sign_in.dart';
import 'package:grocery_app/utils/enum.dart';

import '../../../data/pref.dart';
import '../../../domain/model/email.dart';
import '../../../domain/model/password.dart';


part 'state.dart';
part 'cubit.freezed.dart';

class SignInCubit extends Cubit<LoginState> {
  final SignInUseCase _signInUseCase;
  SignInCubit(this._signInUseCase) : super(const LoginState.initial());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  void logInWithCredentials() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final response = await _signInUseCase.call(SignInRequest(email: state.email.value, password: state.password.value));
      if(response.errorCode == ErrorCode.success){
        final localPref = LocalPref();
        if(response.user != null){
          localPref.saveString("token", response.user!.token);
        }
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
      else{
        emit(state.copyWith(
            status: FormzStatus.submissionFailure, errorMessage: response.errorMessage));
      }
    } catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,errorMessage: error.toString()));
    }
  }
}