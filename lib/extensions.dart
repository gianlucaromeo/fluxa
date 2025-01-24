import 'dart:developer';

import 'package:flutter/material.dart';

extension DoubleToEdgeInsets on List<double> {
  get fromLTRB {
    if (length != 4) {
      log(
        name: 'DoubleToEdgeInsets',
        'Warning: List must have 4 elements. Returning EdgeInsets.zero instead.',
      );
      return EdgeInsets.zero;
    }
    return EdgeInsets.fromLTRB(this[0], this[1], this[2], this[3]);
  }
}
