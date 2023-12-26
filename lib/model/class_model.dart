import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CalssModel {
  String? className;
  String? classDescription;
  CalssModel({
    this.className,
    this.classDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'className': className,
      'classDescription': classDescription,
    };
  }

  factory CalssModel.fromMap(Map<String, dynamic> map) {
    return CalssModel(
      className: map['className'],
      classDescription: map['classDescription'],
    );
  }

  CalssModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : className = snapshot['className'],
        classDescription = snapshot['classDescription'];

  String toJson() => json.encode(toMap());

  factory CalssModel.fromJson(String source) =>
      CalssModel.fromMap(json.decode(source));

  @override
  String toString() => 'CalssModel(className: $className, classDescription: $classDescription)';
}
