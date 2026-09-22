final Map<String, dynamic> locale = {
  'Name': 'de',
  'Months': {
    1: 'Januar',
    2: 'Februar',
    3: 'März',
    4: 'April',
    5: 'Mai',
    6: 'Juni',
    7: 'Juli',
    8: 'August',
    9: 'September',
    10: 'Oktober',
    11: 'November',
    12: 'Dezember'
  },
  'MonthsShort': {
    1: 'Jan.',
    2: 'Feb.',
    3: 'März',
    4: 'Apr.',
    5: 'Mai',
    6: 'Juni',
    7: 'Juli',
    8: 'Aug.',
    9: 'Sept.',
    10: 'Okt.',
    11: 'Nov.',
    12: 'Dez.'
  },
  'Weekdays': {
    1: 'Montag',
    2: 'Dienstag',
    3: 'Mittwoch',
    4: 'Donnerstag',
    5: 'Freitag',
    6: 'Samstag',
    7: 'Sonntag'
  },
  'WeekdaysShort': {
    1: 'Mo.',
    2: 'Di.',
    3: 'Mi.',
    4: 'Do.',
    5: 'Fr.',
    6: 'Sa.',
    7: 'So.'
  },
  'WeekdaysMin': {
    1: 'Mo.',
    2: 'Di.',
    3: 'Mi.',
    4: 'Do.',
    5: 'Fr.',
    6: 'Sa.',
    7: 'So.'
  },
  'AM': 'AM',
  'PM': 'PM',
  'RelativeTime': {
    'future': 'in %s',
    'past': 'vor %s',
    's': 'ein paar Sekunden',
    'm': (int n, bool withoutSuffix) =>
        withoutSuffix ? 'eine Minute' : 'einer Minute',
    'mm': '%d Minuten',
    'h': (int n, bool withoutSuffix) =>
        withoutSuffix ? 'eine Stunde' : 'einer Stunde',
    'hh': '%d Stunden',
    'd': (int n, bool withoutSuffix) => withoutSuffix ? 'ein Tag' : 'einem Tag',
    'dd': (int n, bool withoutSuffix) => withoutSuffix ? '%d Tage' : '%d Tagen',
    'M': (int n, bool withoutSuffix) =>
        withoutSuffix ? 'ein Monat' : 'einem Monat',
    'MM': (int n, bool withoutSuffix) =>
        withoutSuffix ? '%d Monate' : '%d Monaten',
    'y': (int n, bool withoutSuffix) =>
        withoutSuffix ? 'ein Jahr' : 'einem Jahr',
    'yy': (int n, bool withoutSuffix) =>
        withoutSuffix ? '%d Jahre' : '%d Jahren'
  }
};
