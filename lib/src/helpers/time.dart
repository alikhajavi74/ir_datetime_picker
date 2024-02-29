/// [IRTimeModel] used for working with time for example in IRTimePicker when you choose your time you will take an IRTimeModel? object.
/// use [IRTimeModel.fromDuration] for get [IRTimeModel] from your [Duration] object.
/// use [IRTimeModel.fromString] for get [IRTimeModel] from String which must have a standard format. (e.g => 20:57:23 or 20:57)
/// use [toDuration] for convert [IRTimeModel] to [Duration] object.
/// use [toString] for convert [IRTimeModel] to String object.
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

  factory IRTimeModel.fromString(String string) {
    List<String> splitted = string.split(":");
    if (splitted.length == 3) {
      return IRTimeModel(
          hour: int.parse(splitted[0]),
          minute: int.parse(splitted[1]),
          second: int.parse(splitted[2]));
    }
    return IRTimeModel(
        hour: int.parse(splitted[0]), minute: int.parse(splitted[1]));
  }

  Duration toDuration() {
    return Duration(hours: hour, minutes: minute, seconds: second);
  }

  /// Use [withoutSecond] to remove seconds in your string.
  @override
  String toString({bool withoutSecond = false}) {
    if (withoutSecond) {
      return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
    }
    return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")}";
  }
}
