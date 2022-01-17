mixin Unit {
  static const y = 'year';
  static const m = 'month';
  static const d = 'date';
  static const w = 'weekday';
  static const h = 'hour';
  static const min = 'minute';
  static const s = 'second';
  static const ms = 'millisecond';

  static String fromShorthand(String s) {
    if (unitMap.containsKey(s)) {
      return unitMap[s]!;
    }

    return s.trim().toLowerCase();
  }
}

const unitMap = {
  'y': Unit.y,
  'M': Unit.m,
  'd': Unit.d,
  'w': Unit.w,
  'h': Unit.h,
  'm': Unit.min,
  's': Unit.s,
  'ms': Unit.ms
};

const dayDartRegexpFormat =
    r'\[.*\]|Y{1,4}|M{1,4}|D{1,2}|W{1,4}|H{1,2}|h{1,2}|m{1,2}|s{1,2}|SSS|A|a';
