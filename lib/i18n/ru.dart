// Russian cardinal plural rule: one / few / many. The choice depends on the
// last digit unless the whole number falls in 11–14.
String _ruPlural(int n, String one, String few, String many) {
  final d10 = n % 10;
  final d100 = n % 100;
  if (d10 == 1 && d100 != 11) return one;
  if (d10 >= 2 && d10 <= 4 && (d100 < 12 || d100 > 14)) return few;
  return many;
}

final Map<String, dynamic> locale = {
  'Name': 'ru',
  'Months': {
    1: 'январь',
    2: 'февраль',
    3: 'март',
    4: 'апрель',
    5: 'май',
    6: 'июнь',
    7: 'июль',
    8: 'август',
    9: 'сентябрь',
    10: 'октябрь',
    11: 'ноябрь',
    12: 'декабрь'
  },
  'MonthsShort': {
    1: 'янв.',
    2: 'февр.',
    3: 'март',
    4: 'апр.',
    5: 'май',
    6: 'июнь',
    7: 'июль',
    8: 'авг.',
    9: 'сент.',
    10: 'окт.',
    11: 'нояб.',
    12: 'дек.'
  },
  'MonthsFormat': {
    1: 'января',
    2: 'февраля',
    3: 'марта',
    4: 'апреля',
    5: 'мая',
    6: 'июня',
    7: 'июля',
    8: 'августа',
    9: 'сентября',
    10: 'октября',
    11: 'ноября',
    12: 'декабря'
  },
  'MonthsShortFormat': {
    1: 'янв.',
    2: 'февр.',
    3: 'мар.',
    4: 'апр.',
    5: 'мая',
    6: 'июн.',
    7: 'июл.',
    8: 'авг.',
    9: 'сент.',
    10: 'окт.',
    11: 'нояб.',
    12: 'дек.'
  },
  'Weekdays': {
    1: 'понедельник',
    2: 'вторник',
    3: 'среда',
    4: 'четверг',
    5: 'пятница',
    6: 'суббота',
    7: 'воскресенье'
  },
  'WeekdaysShort': {
    1: 'пн',
    2: 'вт',
    3: 'ср',
    4: 'чт',
    5: 'пт',
    6: 'сб',
    7: 'вс'
  },
  'WeekdaysMin': {
    1: 'пн',
    2: 'вт',
    3: 'ср',
    4: 'чт',
    5: 'пт',
    6: 'сб',
    7: 'вс'
  },
  'AM': 'AM',
  'PM': 'PM',
  'RelativeTime': {
    'future': 'через %s',
    'past': '%s назад',
    's': 'несколько секунд',
    'm': (int n, bool withoutSuffix) => withoutSuffix ? 'минута' : 'минуту',
    'mm': (int n, bool withoutSuffix) => _ruPlural(
        n, withoutSuffix ? '%d минута' : '%d минуту', '%d минуты', '%d минут'),
    'h': 'час',
    'hh': (int n, bool withoutSuffix) =>
        _ruPlural(n, '%d час', '%d часа', '%d часов'),
    'd': 'день',
    'dd': (int n, bool withoutSuffix) =>
        _ruPlural(n, '%d день', '%d дня', '%d дней'),
    'M': 'месяц',
    'MM': (int n, bool withoutSuffix) =>
        _ruPlural(n, '%d месяц', '%d месяца', '%d месяцев'),
    'y': 'год',
    'yy': (int n, bool withoutSuffix) =>
        _ruPlural(n, '%d год', '%d года', '%d лет')
  }
};
