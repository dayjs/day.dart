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
