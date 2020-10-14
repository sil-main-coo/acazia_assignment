import 'package:acaziaassignmentclient/core/errors/exceptions.dart';
import 'package:acaziaassignmentclient/core/errors/failures.dart';
import 'package:acaziaassignmentclient/core/network/network_info.dart';
import 'package:acaziaassignmentclient/data/providers/remote_provider.dart';
import 'package:acaziaassignmentclient/data/models/models.dart';

import 'package:dartz/dartz.dart';

abstract class PersonsRepository {
  Future<Either<Failures, List<Person>>> fetchAllPersonsRepository();
}

class PersonRepositoryImpl implements PersonsRepository {
  final RemotePersonsProvider _provider;
  final NetworkInfo _networkInfo;

  PersonRepositoryImpl(this._provider, this._networkInfo);

  @override
  Future<Either<Failures, List<Person>>> fetchAllPersonsRepository() async {
    if (await _networkInfo.isConnected) {
      try {
        final remotePersons = await _provider.fetchAllPersonsProvider();
        //  localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remotePersons);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
