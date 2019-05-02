import 'constants.dart' as C;

const _unitMap = {
  'y': C.Y,
  'M': C.M,
  'w': C.W,
  'd': C.D,
  'h': C.H,
  'm': C.MIN,
  's': C.S,
  'ms': C.MS
};

String processUnit(String unit) {
  if (_unitMap.containsKey(unit)) {
    return _unitMap[unit];
  }

  return unit.trim().toLowerCase();
}

Duration durationFromUnit(int val, String unit) {
  switch (unit) {
    case C.D:
      return Duration(days: val);
    case C.H:
      return Duration(hours: val);
    case C.MIN:
      return Duration(minutes: val);
    case C.S:
      return Duration(seconds: val);
    case C.MS:
      return Duration(milliseconds: val);
    default:
      return null;
  }
}

int processDiffDuration(Duration duration, String unit) {
  switch (unit) {
    case C.D:
      return duration.inDays.abs();
    case C.H:
      return duration.inHours.abs();
    case C.MIN:
      return duration.inMinutes.abs();
    case C.S:
      return duration.inSeconds.abs();
    case C.MS:
      return duration.inMilliseconds.abs();
    default:
      return null;
  }
}
