# Plugins

- [Introduce](#introduce)
- [Plugin List](#plugin-list)
  - [Get Time Values](#get-time-values)

## Introduce

Because dart can't inject a method to an existing class.

So, for now, the plugin system was implement as this, for example:

[lib/plugins/get_time_values.dart](lib/plugins/get_time_values.dart)

```dart
import '../day.dart';

Map<String, int> getTimeValues(Day day) {
  final time = day.time;

  return {
    'year': time.year,
    'month': time.month,
    'date': time.day,
    'weekday': time.weekday,
    'hour': time.hour,
    'minute': time.minute,
    'second': time.second,
    'millisecond': time.millisecond
  };
}
```

All plugin function should receive a day instance as parameter.

Then you can use it like:

[test/plugins/get_time_values_test.dart](test/plugins/get_time_values_test.dart)

```dart
import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/get_time_values.dart';

void main() {
  // Named as getTimeValues
  // 
  // You can also name anything what you like:
  // Day.extend('gtv', getTimeValues);
  // 
  // Then you can use it by:
  // final timeValues = Day.plugins['gtv'](d);
  //
  // Also support shorthand:
  // final timeValues = Day.p['gtv'](d);
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
```

Welcome PRs to add a new plugin. ⚙️

## Plugin List

### Get Time Values

Get `day.time` as a `Map`.

```dart
import 'package:day/day.dart';
import 'package:day/plugins/get_time_values.dart';

void main() {
  Day.extend('getTimeValues', getTimeValues);
  
  final d = Day.fromString('2019-04-30T10:30:30.001Z');
  final timeValues = Day.plugins['getTimeValues'](d);
  
  print(timeValues); // {year: 2019, month: 4, date: 30, weekday: 2, hour: 10, minute: 30, second: 30, millisecond: 1}
}
```
