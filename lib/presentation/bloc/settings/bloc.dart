import 'package:bloc/bloc.dart';
import 'package:grocery_app/backbone/bloc_status.dart';
import 'package:grocery_app/domain/usecase/get_theme.dart';
import 'package:grocery_app/domain/usecase/select_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetThemeUseCase _getThemeUseCase;
  final SelectThemeUseCase _selectThemeUseCase;

  SettingsBloc(this._getThemeUseCase, this._selectThemeUseCase)
      : super(
          const SettingsState(
            BlocStatus.loading,
          ),
        ) {
    // on<GetFiatCurrencyEvent>(
    //   (GetFiatCurrencyEvent event, Emitter<SettingsState> emit) async {
    //     await _getFiatCurrency(emit, event);
    //   },
    // );
    // on<SelectFiatCurrencyEvent>(
    //   (SelectFiatCurrencyEvent event, Emitter<SettingsState> emit) async {
    //     await _selectFiatCurrency(emit, event);
    //   },
    // );
    on<GetThemeEvent>(
      (GetThemeEvent event, Emitter<SettingsState> emit) async {
        await _getTheme(emit, event);
      },
    );
    on<SelectThemeEvent>(
      (SelectThemeEvent event, Emitter<SettingsState> emit) async {
        await _selectTheme(emit, event);
      },
    );
  }

  Future<void> _getTheme(
    Emitter<SettingsState> emit,
    GetThemeEvent event,
  ) async {
    emit(_loadingState());
    emit(await _getThemeUseCase()
        .then(
          (String themeType) => SettingsState(
            BlocStatus.loaded,
            themeType: themeType,
          ),
        )
        .catchError(_onError));
  }

  Future<void> _selectTheme(
    Emitter<SettingsState> emit,
    SelectThemeEvent event,
  ) async {
    emit(_loadingState());
    emit(await _selectThemeUseCase(event.themeType)
        .then(
          (String fiatCurrency) => SettingsState(
            BlocStatus.loaded,
            themeType: event.themeType,
          ),
        )
        .catchError(_onError));
  }

  SettingsState _loadingState() => SettingsState(BlocStatus.loading, themeType: state.themeType);

  Future<SettingsState> _onError(Object error) async => SettingsState(
        BlocStatus.error,
        themeType: state.themeType,
        error: error,
      );
}
