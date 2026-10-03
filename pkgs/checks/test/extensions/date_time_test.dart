// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:checks/checks.dart';
import 'package:test/scaffolding.dart';

import '../test_shared.dart';

void main() {
  group('DateTimeChecks', () {
    final earlier = DateTime.utc(2025, 3, 19);
    final later = DateTime.utc(2025, 3, 20);

    group('isAtSameMomentAs', () {
      test('succeeds for the same moment', () {
        check(earlier).isAtSameMomentAs(DateTime.utc(2025, 3, 19));
      });

      test('succeeds for the same moment in different time zones', () {
        check(earlier.toLocal()).isAtSameMomentAs(earlier);
        check(earlier).isAtSameMomentAs(earlier.toLocal());
      });

      test('fails for a different moment', () {
        check(earlier).isRejectedBy(
          .it()..isAtSameMomentAs(later),
          which: ['is not at the same moment as <2025-03-20 00:00:00.000Z>'],
        );
      });
    });

    group('isBefore', () {
      test('succeeds for an earlier moment', () {
        check(earlier).isBefore(later);
      });

      test('fails for the same moment', () {
        check(earlier).isRejectedBy(
          .it()..isBefore(earlier),
          which: ['is not before <2025-03-19 00:00:00.000Z>'],
        );
      });

      test('fails for a later moment', () {
        check(later).isRejectedBy(
          .it()..isBefore(earlier),
          which: ['is not before <2025-03-19 00:00:00.000Z>'],
        );
      });
    });

    group('isAfter', () {
      test('succeeds for a later moment', () {
        check(later).isAfter(earlier);
      });

      test('fails for the same moment', () {
        check(earlier).isRejectedBy(
          .it()..isAfter(earlier),
          which: ['is not after <2025-03-19 00:00:00.000Z>'],
        );
      });

      test('fails for an earlier moment', () {
        check(earlier).isRejectedBy(
          .it()..isAfter(later),
          which: ['is not after <2025-03-20 00:00:00.000Z>'],
        );
      });
    });
  });
}
