import 'package:test/test.dart';
import 'package:day.dart/day.dart';

void main() {
  group('Day Constructor', () {
    test('No argument', () {
      var day = Day();
      expect(day.time is DateTime, true);
    });
  });
}
