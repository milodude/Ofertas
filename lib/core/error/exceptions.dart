class ServerException implements Exception{
  final String message;

  ServerException(this.message);
}

class CachedException implements Exception{
  final String message;

  CachedException(this.message);
}
