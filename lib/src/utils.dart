import 'constants.dart';

class Utils {
  processUnit(String unit) {
    const unitMap = {
      'Y': Constants.Y,
      'M': Constants.M,
      'W': Constants.W,
      'D': Constants.D,
      'H': Constants.H,
      'MIN': Constants.MIN,
      'S': Constants.S,
      'MS': Constants.MS
    };
  }
}
