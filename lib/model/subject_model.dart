import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectModel {
  String? subjectName;
  String? subjectDescrition;
  String? pdfUrl;
  SubjectModel({
    this.subjectName,
    this.subjectDescrition,
    this.pdfUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'subjectName': subjectName,
      'subjectDescrition': subjectDescrition,
      'pdfUrl': pdfUrl,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      subjectName: map['subjectName'],
      subjectDescrition: map['subjectDescrition'],
      pdfUrl: map['pdfUrl'],
    );
  }

  SubjectModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : subjectName = snapshot['subjectName'],
        subjectDescrition = snapshot['subjectDescrition'],
        pdfUrl = snapshot['pdfUrl'];

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SubjectModel(subjectName: $subjectName, subjectDescrition: $subjectDescrition, pdfUrl: $pdfUrl)';
}
