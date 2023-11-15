/// [IRTimeModel] use for working with time.
/// in fact in IRTimePicker when you choose your time you will take a IRTimeModel? object.
library;

class IRTimeModel {
  int hour;
  int minute;

  IRTimeModel({required this.hour, required this.minute})
      : assert(0 <= hour && hour <= 23, "hour is not valid"),
        assert(0 <= minute && minute <= 59, "minute is not valid");

  @override
  String toString() {
    return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
  }
}
