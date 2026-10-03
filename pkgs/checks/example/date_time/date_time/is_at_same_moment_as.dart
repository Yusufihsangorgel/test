// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:checks/checks.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('isAtSameMomentAs', () {
    final moment = DateTime.utc(2025, 3, 19);

    // This check succeeds, even though the time zone encoding differs.
    check(moment.toLocal()).isAtSameMomentAs(moment);

    // This check fails.
    check(DateTime.utc(2025, 3, 20)).isAtSameMomentAs(moment);
    // Expected: a value at the same moment as <2025-03-19 00:00:00.000Z>
    // Actual: <2025-03-20 00:00:00.000Z>
    // Which: is not at the same moment as <2025-03-19 00:00:00.000Z>
  });
}
