const Y = 'year';
const M = 'month';
const W = 'weekday';
const D = 'date';
const H = 'hour';
const MIN = 'minute';
const S = 'second';
const MS = 'millisecond';

const REGEXP_FORMAT =
    r'^Y{1,4}|M{1,4}|D{1,2}|W{1,4}|H{1,2}|h{1,2}|m{1,2}|s{1,2}|SSS|A|a$';

const MONTHS = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December'
};

const WEEKDAYS = {
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wednesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
  7: 'Sunday'
};
