
import 'package:dio/dio.dart';
import 'package:grocery_app/data/network/remote_repository/authentication_repository.dart';
import 'package:grocery_app/data/service/authentication_service.dart';
import 'package:grocery_app/data/service/history_data_service.dart';
import 'package:grocery_app/data/service/hive_settings.dart';
import 'package:grocery_app/domain/usecase/get_history_data.dart';
import 'package:grocery_app/domain/usecase/get_theme.dart';
import 'package:grocery_app/domain/usecase/select_theme.dart';
import 'package:grocery_app/domain/usecase/sign_in.dart';
import 'package:grocery_app/presentation/bloc/chart/bloc.dart';
import 'package:grocery_app/presentation/bloc/login/cubit.dart';
import 'package:grocery_app/presentation/bloc/settings/bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/network/api_client.dart';
import '../data/network/remote_repository/category_repository.dart';
import '../data/network/remote_repository/settings.dart';
import '../data/network/remote_repository/rest.dart';

final GetIt sl = GetIt.instance;

void init() {
  // Client
  sl.registerLazySingleton<ApiClient>(() => ApiClientImpl(Dio()));

  //Gateway
  sl.registerLazySingleton<RestGateway>(() => RestGateway(
  ));
  sl.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl());
  sl.registerLazySingleton<CategoryRepository>(
          () => CategoryRepositoryImpl());
  sl.registerLazySingleton<SettingsGateway>(() => SettingsGateway());

  //Service
  sl.registerLazySingleton<SettingsService>(
      () => HiveSettingsService(sl.get()));
  sl.registerLazySingleton<HistoryDataService>(
          () => HistoryDataServiceImpl(sl.get()));
  sl.registerLazySingleton<AuthenticationService>(
          () => AuthenticationServiceImpl(sl.get()));
  //UseCase
  sl.registerLazySingleton<GetThemeUseCase>(
      () => RestGetThemeUseCase(sl.get()));
  sl.registerLazySingleton<SelectThemeUseCase>(
      () => RestSelectThemeUseCase(sl.get()));
  sl.registerLazySingleton<GetHistoryDataUseCase>(
          () => RestGetHistoryDataUseCase(sl.get()));
  sl.registerLazySingleton<SignInUseCase>(
          () => SignInUseCaseImpl(sl.get()));
  //Bloc
  sl.registerLazySingleton<SettingsBloc>(
      () => SettingsBloc(sl.get(), sl.get()));
  sl.registerLazySingleton<ChartBloc>(
          () => ChartBloc(sl.get()));
  sl.registerLazySingleton<SignInCubit>(
          () => SignInCubit(sl.get()));
}
