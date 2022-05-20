import 'package:bloc/bloc.dart';
import 'package:grocery_app/backbone/bloc_status.dart';
import 'package:grocery_app/data/model/get_history_data_response.dart';
import 'package:grocery_app/domain/entity/get_history_data_service_response.dart';
import 'package:grocery_app/domain/usecase/get_history_data.dart';
import 'package:grocery_app/domain/usecase/get_theme.dart';
import 'package:grocery_app/domain/usecase/select_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  final GetHistoryDataUseCase _getHistoryDataUseCase;
  ChartBloc(this._getHistoryDataUseCase)
      : super(
          const ChartState(
            BlocStatus.loading,
          ),
        ) {
    on<GetHistoryDataEvent>(
          (GetHistoryDataEvent event, Emitter<ChartState> emit) async {
        await event.when(
          getHistoryData: (DateTime timeStart,DateTime timeEnd) =>
              _getHistoryData(emit,timeStart,timeEnd),
        );
      },
    );
  }
  Future<void> _getHistoryData(Emitter<ChartState> emit,DateTime timeStart,DateTime timeEnd) async {
    emit(loadingState());
    emit(await _getHistoryDataUseCase(timeStart, timeEnd).then((value)
    => ChartState(BlocStatus.loaded, result: value))
        .catchError(_onError));
  }

  ChartState loadingState() => const ChartState(BlocStatus.loading);

  ChartState loadedState() => const ChartState(BlocStatus.loaded);

  Future<ChartState> _onError(Object error) async => ChartState(
        BlocStatus.error,
        error: error,
      );

  int getXNumbers(ChartState state){
    final int? length  = state.result?.response?.data.quotes.length;
    return length! - 1;
  }

}
