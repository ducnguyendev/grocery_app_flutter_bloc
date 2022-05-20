part of 'bloc.dart';

@immutable
@freezed
abstract class ChartEvent with _$ChartEvent {
  const ChartEvent._();

  const factory ChartEvent.getHistoryData(DateTime timeStart, DateTime timeEnd) = GetHistoryDataEvent;
}
