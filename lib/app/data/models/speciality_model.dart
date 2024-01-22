import 'package:appointment/app/domain/entities/speciality.dart';

class SpecialityModel extends Speciality {
  const SpecialityModel(
      {required super.id, required super.name, required super.image});

  factory SpecialityModel.fromJson(Map<String, dynamic> json) =>
      SpecialityModel(
        id: json[''],
        name: json[''],
        image: json[''],
      );
}
