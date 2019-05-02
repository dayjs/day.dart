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
