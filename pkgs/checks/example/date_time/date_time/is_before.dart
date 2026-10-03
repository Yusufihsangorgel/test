// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:checks/checks.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('isBefore', () {
    final earlier = DateTime.utc(2025, 3, 19);
    final later = DateTime.utc(2025, 3, 20);

    // This check succeeds.
    check(earlier).isBefore(later);

    // This check fails.
    check(later).isBefore(earlier);
    // Expected: a value before <2025-03-19 00:00:00.000Z>
    // Actual: <2025-03-20 00:00:00.000Z>
    // Which: is not before <2025-03-19 00:00:00.000Z>
  });
}
