import 'dart:convert';
import 'package:grocery_app/utils/date_util.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../domain/entity/response/get_history_data_response.dart';
import '../../../domain/entity/response/get_history_data_service_response.dart';
import '../../../utils/rest_api_urls.dart';

class RestGateway {
  RestGateway(
  );

  Future<GetHistoryDataServiceResponse> getHistoryData(DateTime timeStart,DateTime timeEnd) async {
    final String uri = marketUrl + '&timeStart=${getTimestamp(timeStart)}&timeEnd=${getTimestamp(timeEnd)}';
    final Response response = await http.get(Uri.parse(uri));
    GetHistoryDataServiceResponse result = GetHistoryDataServiceResponse(response: null, errorMessage: '', errorCode: -1);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
      json.decode(response.body) as Map<String, dynamic>;
      final GetHistoryDataResponse getHistoryDataResponse = GetHistoryDataResponse.fromJson(jsonResponse);
      result = GetHistoryDataServiceResponse(response: getHistoryDataResponse, errorMessage: '', errorCode: 0);
    }
    return result;
  }
}
