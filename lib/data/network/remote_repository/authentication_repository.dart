import 'dart:convert';

import 'package:grocery_app/utils/rest_api_urls.dart';
import 'package:grocery_app/backbone/dependency_injection.dart' as di;
import '../../../domain/entity/request/signin_request.dart';
import '../../../domain/entity/response/sign_in_response.dart';
import '../../../domain/model/user.dart';
import '../../../utils/enum.dart';
import '../api_client.dart';

abstract class AuthenticationRepository {
  Future<SignInResponse> signIn(SignInRequest signInRequest);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository{

  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    // final String uri = baseUrl + '&timeStart=${getTimestamp(timeStart)}&timeEnd=${getTimestamp(timeEnd)}';
    // final Response response = await http.get(Uri.parse(uri));
    // GetHistoryDataServiceResponse result = GetHistoryDataServiceResponse(response: null, errorMessage: '', errorCode: -1);
    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> jsonResponse =
    //   json.decode(response.body) as Map<String, dynamic>;
    //   final GetHistoryDataResponse getHistoryDataResponse = GetHistoryDataResponse.fromJson(jsonResponse);
    //   result = GetHistoryDataServiceResponse(response: getHistoryDataResponse, errorMessage: '', errorCode: 0);
    // }
    final ApiClient apiClient = di.sl.get();
    final response = await apiClient.post(signInUrl,body: signInRequest.toJson());
    if (response.statusCode == 200) {
       final user = User.fromJson(response.data);
       return SignInResponse(user, errorMessage: "", errorCode: ErrorCode.success);
    }
    return SignInResponse(null,errorMessage: response.data['message'] ? response.data['message'] : "Invalid email or password", errorCode: ErrorCode.failure);

  }

}