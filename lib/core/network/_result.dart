

import 'package:money_manga/core/enums/status.dart';

class Result<T> {
  Status status;
  T data;
  String message;

  Result(this.status, this.data, this.message);

  static Result<T> success<T>(T data) => Result(Status.SUCCESS, data, "");

  static Result<T?> error<T>( String message) =>
      Result(Status.ERROR, null, message);

/*
  static Result<T> loading<T>(T data, String message) => Result(Status.LOADING, null, null);

  static Result<T> session<T>(T data, String message) => Result(Status.SESSION, null, null);*/

}
