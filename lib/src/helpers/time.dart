/// [IRTimeModel] used for working with time for example in IRTimePicker when you choose your time you will take an IRTimeModel? object.
/// use [IRTimeModel.fromDuration] for get [IRTimeModel] from your [Duration] object.
/// use [toDuration] for convert [IRTimeModel] to [Duration] object.
class IRTimeModel {
  int hour;
  int minute;
  int second;

  IRTimeModel({required this.hour, required this.minute, this.second = 0})
      : assert(0 <= hour && hour <= 23, "hour is not valid"),
        assert(0 <= minute && minute <= 59, "minute is not valid"),
        assert(0 <= second && second <= 59, "second is not valid");

  factory IRTimeModel.fromDuration(Duration duration) {
    List<String> splitted = duration.toString().split(":");
    int hour = int.parse(splitted[0]);
    int minute = int.parse(splitted[1]);
    int second = num.parse(splitted[2]).toInt();
    return IRTimeModel(hour: hour, minute: minute, second: second);
  }

  @override
  String toString() {
    return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")}";
  }

  Duration toDuration() {
    return Duration(hours: hour, minutes: minute, seconds: second);
  }
}
