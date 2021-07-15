

import 'package:money_manga/core/enums/status.dart';

class Result<T> {
  Status status;
  T? data;
  String message;

  Result(this.status, this.data, this.message);

  static Result<T> success<T>(T data) => Result(Status.SUCCESS, data, "");

  static Result<T> error<T>(String message) =>
      Result(Status.ERROR, null, message);
}
