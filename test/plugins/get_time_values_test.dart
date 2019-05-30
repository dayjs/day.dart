import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/get_time_values.dart';

void main() {
  Day.extend('getTimeValues', getTimeValues);

  test('Plugin => Get Time Values:', () {
    final d = Day.fromString('2019-04-30T10:30:30.001Z');
    final timeValues = Day.plugins['getTimeValues'](d);

    expect(timeValues['year'], 2019);
    expect(timeValues['month'], 4);
    expect(timeValues['date'], 30);
    expect(timeValues['weekday'], 2);
    expect(timeValues['hour'], 10);
    expect(timeValues['minute'], 30);
    expect(timeValues['second'], 30);
    expect(timeValues['millisecond'], 1);
  });
}
