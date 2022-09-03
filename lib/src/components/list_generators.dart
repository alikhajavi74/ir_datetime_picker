List<int> generateYearsList(int startYear, int endYear) {
  List<int> years = [];
  for (int i = startYear; i <= endYear; i++) {
    years.add(i);
  }
  return years;
}

List<int> generateDaysList(int monthLength) {
  return List<int>.generate(monthLength, (index) => index + 1);
}
