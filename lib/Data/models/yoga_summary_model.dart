import 'package:yoga_app/Data/models/yoga_model.dart';

class YogaSummary{
  final int? id;
  // final int? yogakey;
  final String YogaWorkOutName;
  final String BackImg;
  final String TimeTaken;
  final String TotalNoOfWorkOut;

  const YogaSummary({
    this.id,
    // required this.yogakey,
    required this.YogaWorkOutName,
    required this.BackImg,
    required this.TimeTaken,
    required this.TotalNoOfWorkOut,
  });

  YogaSummary copy({
    int? id,
    // int? yogakey,
    String? YogaWorkOutName,
    String? BackImg,
    String? TimeTaken,
    String? TotalNoOfWOrkOut}){

    return YogaSummary(
        id: id ?? this.id,
        // yogakey: yogakey ?? this.yogakey,
        YogaWorkOutName: YogaWorkOutName ?? this.YogaWorkOutName,
        BackImg: BackImg ?? this.BackImg,
        TimeTaken: TimeTaken ?? this.TimeTaken,
        TotalNoOfWorkOut: TotalNoOfWorkOut ?? this.TotalNoOfWorkOut
    );
  }

  static YogaSummary fromJson(Map<String,Object?> json){
    return YogaSummary(
        id: json[YogaModel.IdName] as int?,
        // yogakey: json[YogaModel.YogaKey] as int?,
        YogaWorkOutName: json[YogaModel.YogaWorkOutName] as String,
        BackImg: json[YogaModel.BackImg] as String,
        TimeTaken: json[YogaModel.TimeTaken] as String,
        TotalNoOfWorkOut: json[YogaModel.TotalNoOfWorkOut] as String
    );
  }

  Map<String, Object?> toJson(){
    return {
      YogaModel.IdName : id,
      // YogaModel.YogaKey : yogakey,
      YogaModel.YogaWorkOutName : YogaWorkOutName,
      YogaModel.BackImg : BackImg,
      YogaModel.TimeTaken : TimeTaken,
      YogaModel.TotalNoOfWorkOut : TotalNoOfWorkOut
    };
  }
}