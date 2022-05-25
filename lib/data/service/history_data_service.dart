import '../../domain/entity/response/get_history_data_service_response.dart';
import '../network/remote_repository/rest.dart';

abstract class HistoryDataService {
  Future<GetHistoryDataServiceResponse> getHistoryData(DateTime timeStart,DateTime timeEnd);
}

class HistoryDataServiceImpl implements HistoryDataService{
  final RestGateway _gateway;
  HistoryDataServiceImpl(this._gateway);
  @override
  Future<GetHistoryDataServiceResponse> getHistoryData(DateTime timeStart,DateTime timeEnd) async{
    return await _gateway.getHistoryData(timeStart,timeEnd);
  }

}