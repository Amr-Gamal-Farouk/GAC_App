import 'package:flutter/material.dart';

extension HexColorExt on String {
  /// Container(
  ///    color: "#2B2B2B".fromHex,
  ///     ...
  /// ),
  /// ...
  Color get fromHex {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }

    if (startsWith('#')) {
      buffer.write(replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }

}
