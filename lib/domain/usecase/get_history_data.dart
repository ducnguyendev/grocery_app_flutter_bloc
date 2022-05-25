import '../../data/service/history_data_service.dart';
import '../entity/response/get_history_data_service_response.dart';

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
