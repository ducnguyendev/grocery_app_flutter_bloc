import '../../data/service/authentication_service.dart';
import '../entity/request/signin_request.dart';
import '../entity/response/sign_in_response.dart';

abstract class SignInUseCase {
  Future<SignInResponse>call(SignInRequest signInRequest);
}

class SignInUseCaseImpl implements SignInUseCase {
  final AuthenticationService _service;

  SignInUseCaseImpl(this._service);

  @override
  Future<SignInResponse> call(SignInRequest signInRequest)
  => _service.signIn(signInRequest);

}