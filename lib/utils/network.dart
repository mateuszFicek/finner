// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// Project imports:
import 'failure.dart';

Future<Either<Failure, T>> ioSafe<T>(ApiCall<T> call) async {
  try {
    return right(await call());
  } on DioError catch (e) {
    return left(Failure(e.message));
  }
}

typedef ApiCall<T> = FutureOr<T> Function();
