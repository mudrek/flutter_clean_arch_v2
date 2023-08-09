abstract class NiweException {
  final String title;
  final String msg;

  const NiweException(
      {this.msg = 'Ocorreu um erro', this.title = 'Este é um erro genérico'});
}

class ServerException extends NiweException {
  const ServerException({
    String msg = 'Server Failure',
  }) : super(msg: msg);
}

class GenericException extends NiweException {
  const GenericException({
    String msg = 'Generic Failure',
  }) : super(msg: msg);
}
