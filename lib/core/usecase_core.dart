import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import 'exceptions.dart';

AsyncResult<T, NiweException> usecaseCore<T extends Object>({
  required Future<T> Function() task,
  NiweException? Function(Object e)? onException,
}) async {
  try {
    final result = await task();
    return Result.success(result);
  } catch (e, stacktrace) {
    debugPrint(stacktrace.toString());

    // if (e is DioException) {
    //   debugPrint(e.response.toString());
    // } else if (e is Exception || e is TypeError) {
    //   debugPrint(stacktrace.toString());
    // }
    final failure = onException?.call(e);
    if (failure != null) {
      return Result.failure(failure);
    }
    return Result.failure(const GenericException());
  }
}
