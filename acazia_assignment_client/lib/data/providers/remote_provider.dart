import 'package:acaziaassignmentclient/core/errors/exceptions.dart';
import 'package:acaziaassignmentclient/data/models/models.dart';

import 'package:dio/dio.dart';

abstract class RemotePersonsProvider {
  Future<List<Person>> fetchAllPersonsProvider();
}

class RemotePersonsProviderImpl implements RemotePersonsProvider {
  final Dio dio;

  RemotePersonsProviderImpl({this.dio});

  @override
  Future<List<Person>> fetchAllPersonsProvider() async {
    final List<Person> allPerson = List<Person>();

    final response = await dio.get('?results=10');

    if (response.statusCode == 200) {
      if (response.data['results'] != null) {
        response.data['results'].forEach((v) {
          allPerson.add(new Person.fromJson(v));
        });
      }
      return allPerson;
    }
    throw ServerException();
  }
}
