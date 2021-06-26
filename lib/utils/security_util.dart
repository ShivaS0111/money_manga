import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

/// AES/CBC encrypt / decrypt
class SecurityUtils {

  static List<int> get _baseByteArray => '00001101-0000-1000-8000-00805F9B34FB'.codeUnits;

  static Key get _defaultKey {
    final sha = sha256.convert(_baseByteArray).toString().substring(0, 32);
    return Key(Uint8List.fromList(utf8.encode(sha).sublist(0, 32)));
  }

  static IV get _defaultIv {
    final bytes = utf8.encode(Base64Encoder().convert(_baseByteArray)).sublist(0, 16);
    return IV(Uint8List.fromList(bytes));
  }

  static String encrypt(String source, {Padding padding = Padding.pkcs7, String? seed}) {

    var key = _defaultKey;
    var iv = _defaultIv;
    if (seed != null) {
      key = _generateKey(seed);
      iv = _generateIv(seed);
    }

    return Encrypter(AES(key, mode: AESMode.cbc, padding: padding.name))
        .encrypt(source, iv: iv).base64;
  }

  static String decrypt(String source, {Padding padding = Padding.pkcs7, String? seed}) {

    var key = _defaultKey;
    var iv = _defaultIv;
    if (seed != null) {
      key = _generateKey(seed);
      iv = _generateIv(seed);
    }

    return Encrypter(AES(key, mode: AESMode.cbc, padding: padding.name))
        .decrypt(Encrypted.fromBase64(source), iv: iv);
  }

  static Key _generateKey(String seed) {
    final sha = sha256.convert(seed.codeUnits).toString().substring(0, 32);
    return Key(Uint8List.fromList(utf8.encode(sha).sublist(0, 32)));
  }

  static IV _generateIv(String seed) {
    final bytes = utf8.encode(Base64Encoder().convert(seed.codeUnits)).sublist(0, 16);
    return IV(Uint8List.fromList(bytes));
  }
}

enum Padding {
  // pkcs7 covers pkcs5
  pkcs7,
  iso7816_4,
  no,
}

extension _ToString on Padding {

  String? get name {

    if (index == Padding.pkcs7.index) {
      return 'PKCS7';
    } else if (index == Padding.iso7816_4.index) {
      return 'ISO7816-4';
    }

    return null;
  }
}