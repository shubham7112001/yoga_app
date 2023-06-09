class YogaModel{
  static String YogaTable1 = "BeginnerYoga";
  static String YogaTable2 = "WeightLossYoga";
  static String YogaTable3 = "KidsYoga";
  static String YogaSummary = "YogaSummary";
  static String YogaWorkOutName = "YogaWorkOutName";
  static String BackImg = "BackImg";
  static String TimeTaken = "TimeTaken";
  static String TotalNoOfWorkOut = "TotalNoOfWorkOut";
  static String YogaKey = "yogakey";

  static String IdName = "ID";
  static String YogaName = "YogaName";
  static String SecondsOrNot = "SecondsOrNot";
  static String SecondsOrTimes = "SecondsOrTimes";
  static String ImageName = "ImageName";
  static List<String>? YogaTable1ColumnName = [YogaModel.IdName,YogaModel.YogaName,YogaModel.SecondsOrNot,YogaModel.ImageName,YogaModel.SecondsOrTimes,YogaModel.YogaKey];

}

class Yoga{
  final int? id;
  final bool Seconds;
  final String YogaTitle;
  final String YogaImgUrl;
  final String SecondsOrTimes;

  const Yoga({
    this.id,
    required this.Seconds,
    required this.YogaTitle,
    required this.YogaImgUrl,
    required this.SecondsOrTimes
});

  Yoga copy({
    int? id,
    bool? Seconds,
    String? YogaTitle,
    String? YogaImgUrl,
    String? SecondsOrTimes
  }){
      return Yoga(
        id: id ?? this.id,
        Seconds: Seconds ?? this.Seconds,
        YogaImgUrl: YogaImgUrl ?? this.YogaImgUrl,
        YogaTitle: YogaTitle ?? this.YogaTitle,
        SecondsOrTimes: SecondsOrTimes ?? this.SecondsOrTimes,
      );
    }

    static Yoga fromJson(Map<String,Object?> json){
    return Yoga(
      id: json[YogaModel.IdName] as int?,
      Seconds: json[YogaModel.SecondsOrNot] == 1,
      YogaImgUrl: json[YogaModel.ImageName] as String,
      YogaTitle: json[YogaModel.YogaName] as String,
      SecondsOrTimes: json[YogaModel.SecondsOrTimes] as String
      );
    }

    Map<String, Object?> toJson(){
    return {
      YogaModel.IdName : id,
      YogaModel.SecondsOrNot : Seconds ? 1 : 0,
      YogaModel.YogaName : YogaTitle,
      YogaModel.ImageName : YogaImgUrl,
      YogaModel.SecondsOrTimes : SecondsOrTimes
       };
    }
}

