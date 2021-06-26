
import 'package:flutter/material.dart';
import 'package:money_manga/utils/logger.dart';

enum BuildType {
  dev,
  field,
  prod
}

/// Initialize App environment.
///
/// ```dart
/// // Call once for initialize
/// Environment(buildType: BuildType.dev);
///
/// // After initialize, use like this
/// Environment.instance?.isProduction;
/// Environment.instance!.isProduction;
/// ```
///
/// ** Need to research Singleton for null-safety environment
///
class Environment {

  static Environment? _instance;
  final BuildType buildType;

  factory Environment({
    required BuildType buildType,
  }) => _instance = Environment._internal(buildType);

  Environment._internal(this.buildType) {

    if (buildType == BuildType.prod) {
      InviaLog.logLevel = LogLevel.error;
    } else {
      InviaLog.logLevel = LogLevel.verbose;
    }
  }

  static Environment get instance => _instance!;
  bool get isProduction => buildType == BuildType.prod;

}