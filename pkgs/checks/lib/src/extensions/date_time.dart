// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../../context.dart';

extension DateTimeChecks on Subject<DateTime> {
  /// Expects that this value represents the same moment in time as [other].
  ///
  /// Uses [DateTime.isAtSameMomentAs], which compares the moment in time even
  /// when the values use different time zones.
  ///
  /// {@example /example/date_time/date_time/is_at_same_moment_as.dart}
  void isAtSameMomentAs(DateTime other) {
    context.expect(
      () => prefixFirst('is at the same moment as ', literal(other)),
      predicateNoun: () {
        final l = literal(other).singleOrNull;
        return l != null ? 'a value at the same moment as $l' : null;
      },
      (actual) {
        if (actual.isAtSameMomentAs(other)) return null;
        return Rejection(
          which: prefixFirst('is not at the same moment as ', literal(other)),
        );
      },
    );
  }

  /// Expects that this value is before [other] according to [DateTime.isBefore].
  ///
  /// The comparison is independent of whether either value is UTC or local.
  ///
  /// {@example /example/date_time/date_time/is_before.dart}
  void isBefore(DateTime other) {
    context.expect(
      () => prefixFirst('is before ', literal(other)),
      predicateNoun: () {
        final l = literal(other).singleOrNull;
        return l != null ? 'a value before $l' : null;
      },
      (actual) {
        if (actual.isBefore(other)) return null;
        return Rejection(which: prefixFirst('is not before ', literal(other)));
      },
    );
  }

  /// Expects that this value is after [other] according to [DateTime.isAfter].
  ///
  /// The comparison is independent of whether either value is UTC or local.
  ///
  /// {@example /example/date_time/date_time/is_after.dart}
  void isAfter(DateTime other) {
    context.expect(
      () => prefixFirst('is after ', literal(other)),
      predicateNoun: () {
        final l = literal(other).singleOrNull;
        return l != null ? 'a value after $l' : null;
      },
      (actual) {
        if (actual.isAfter(other)) return null;
        return Rejection(which: prefixFirst('is not after ', literal(other)));
      },
    );
  }
}
