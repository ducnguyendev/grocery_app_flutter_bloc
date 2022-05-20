part of 'bloc.dart';

@immutable
class ChartState {
  final BlocStatus status;
  final GetHistoryDataServiceResponse? result;
  final Object? error;
  const ChartState(
    this.status, {
    this.result,
    this.error,
  });
}
