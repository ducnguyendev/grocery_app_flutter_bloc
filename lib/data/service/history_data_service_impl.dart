import 'package:grocery_app/data/gateway/rest.dart';

import '../../domain/entity/get_history_data_service_response.dart';
import '../../domain/service/history_data.dart';

class HistoryDataServiceImpl implements HistoryDataService{
  final RestGateway _gateway;
  HistoryDataServiceImpl(this._gateway);
  @override
  Future<GetHistoryDataServiceResponse> getHistoryData(DateTime timeStart,DateTime timeEnd) async{
    return await _gateway.getHistoryData(timeStart,timeEnd);
  }

}