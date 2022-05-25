import 'package:grocery_app/data/network/remote_repository/authentication_repository.dart';

import '../../domain/entity/request/signin_request.dart';
import '../../domain/entity/response/sign_in_response.dart';

abstract class AuthenticationService {
  Future<SignInResponse> signIn(SignInRequest signInRequest);
}

class AuthenticationServiceImpl implements AuthenticationService{
  final AuthenticationRepository _authenticationRepository;

  AuthenticationServiceImpl(this._authenticationRepository);

  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) async{
    return await _authenticationRepository.signIn(signInRequest);
  }

}