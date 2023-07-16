// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class Pet extends Equatable {
  final String type;
  final String gender;
  final String size;
  final String age;
  final bool good_with_children;
  final String id;
  final List<dynamic> photoUrls;


  const Pet({
    required this.type,
    required this.gender,
    required this.size,
    required this.age,
    required this.good_with_children,
    required this.id,
    required this.photoUrls
  });
  

  factory Pet.fromJson(Map<String, dynamic> json) {
       final List<dynamic> jsonPhotos = json['photos'];
    final List<dynamic> photoUrls =
        jsonPhotos.map((photoJson) => photoJson['url'] as String?).toList();
    return Pet(
      photoUrls: photoUrls,
      type: json['type'],
      gender: json['gender'],
      size: json['size'],
      age: json['age'],
      good_with_children: json['good_with_children'],
      id: json['pet_id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'gender': gender,
      'size': size,
      'age': age,
      'good_with_children': good_with_children,
      'id': id,
    };
  }

  @override
  List<Object?> get props => [type, gender, size, age, good_with_children, id];
}
