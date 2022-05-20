import '../entity/get_history_data_service_response.dart';

abstract class HistoryDataService {
  Future<GetHistoryDataServiceResponse> getHistoryData(DateTime timeStart,DateTime timeEnd);
}
