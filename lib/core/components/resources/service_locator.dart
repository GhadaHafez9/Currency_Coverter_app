
import 'package:currency_converter_app/core/api/api_services.dart';
import 'package:currency_converter_app/features/Currrency/Data/data_source/currency_conversion_data_source.dart';
import 'package:currency_converter_app/features/Currrency/Data/repo.impl/currency_conversion_repo_impl.dart';
import 'package:currency_converter_app/features/Currrency/Domain/repo/currency_repo.dart';
import 'package:currency_converter_app/features/Currrency/Domain/usecases/currency_conversion.dart';
import 'package:currency_converter_app/features/Currrency/Presentation/controllers/currency_converter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initGetIt() {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<ApiServices>(() => ApiServices(sl()));

  sl.registerLazySingleton<CurrencyRemoteDataSource>(
          () => CurrencyRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<CurrencyRepo>(() => CurrencyRepositoryImpl(sl()));

  sl.registerLazySingleton(() => ConvertCurrencyUseCase(sl<CurrencyRepo>()));

  sl.registerFactory(() => CurrencyBloc(sl<ConvertCurrencyUseCase>()));
}