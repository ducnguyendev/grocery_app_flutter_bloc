import '../entity/get_history_data_service_response.dart';
import '../service/history_data.dart';

abstract class GetHistoryDataUseCase {
  Future<GetHistoryDataServiceResponse> call(DateTime timeStart,DateTime timeEnd);
}

class RestGetHistoryDataUseCase implements GetHistoryDataUseCase {
  final HistoryDataService _service;

  RestGetHistoryDataUseCase(this._service);

  @override
  Future<GetHistoryDataServiceResponse> call(DateTime timeStart,DateTime timeEnd)
  => _service.getHistoryData(timeStart,timeEnd);

}
