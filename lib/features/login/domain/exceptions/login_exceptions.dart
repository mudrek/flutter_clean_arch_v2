import '../../../../core/exceptions.dart';

class EmailException extends NiweException {
  const EmailException({
    required String msg,
  }) : super(msg: msg);
}

class PasswordException extends NiweException {
  const PasswordException({
    required String msg,
  }) : super(msg: msg);
}
