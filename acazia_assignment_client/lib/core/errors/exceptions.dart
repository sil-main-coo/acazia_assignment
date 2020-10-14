class CacheException implements Exception {
  final String mess;

  CacheException({this.mess});
}

class ServerException implements Exception {
  final String mess;

  ServerException({this.mess});
}
