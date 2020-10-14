import 'package:acaziaassignmentclient/core/network/network_info.dart';
import 'package:acaziaassignmentclient/core/services/web_service.dart';
import 'package:acaziaassignmentclient/data/providers/remote_provider.dart';
import 'package:acaziaassignmentclient/data/repositories/repository.dart';
import 'package:acaziaassignmentclient/presentation/pages/home/bloc/home_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setUpLocator() {
//  //! External
  locator.registerLazySingleton(() => WebService());
  locator.registerLazySingleton(() => DataConnectionChecker());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // Data sources
  locator.registerLazySingleton<RemotePersonsProvider>(
      () => RemotePersonsProviderImpl(dio: locator<WebService>().setupDio()));
//
  // Repo
  locator.registerLazySingleton<PersonsRepository>(
      () => PersonRepositoryImpl(locator(), locator()));
//
  // Bloc
  locator.registerLazySingleton(() => HomeBloc(locator()));
}
