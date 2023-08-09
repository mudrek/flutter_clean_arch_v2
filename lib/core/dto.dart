import 'package:result_dart/result_dart.dart';

import 'exceptions.dart';

abstract class DTO {
  const DTO();
}

abstract class DTOValidate extends DTO {
  const DTOValidate();

  Result<DTO, NiweException> validate();
}
