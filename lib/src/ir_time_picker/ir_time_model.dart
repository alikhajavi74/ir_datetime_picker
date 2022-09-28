class IRTimeModel {
  int hour;
  int minute;

  IRTimeModel({required this.hour, required this.minute});

  @override
  String toString() {
    return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
  }
}
