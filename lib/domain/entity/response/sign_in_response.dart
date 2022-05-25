import 'package:grocery_app/domain/entity/base_response.dart';
import 'package:grocery_app/domain/model/user.dart';

import '../../../utils/enum.dart';

class SignInResponse extends SimpleResponse{
  final User? user;
  SignInResponse(this.user, {required String errorMessage, required ErrorCode errorCode}) :
        super(errorMessage: errorMessage, errorCode: errorCode);

}