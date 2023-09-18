import 'package:cloud_firestore/cloud_firestore.dart';

class ExperienceModel {
  final String name;
  final String title;
  final String location;
  final List<String> descriptions;
  final bool isFinish;
  final bool isExperience;
  final int startDateMonth;
  final int startDateYear;
  final int? finishDateMonth;
  final int? finishDateYear;

  const ExperienceModel(
    this.descriptions,
    this.finishDateMonth,
    this.finishDateYear, {
    required this.name,
    required this.title,
    required this.location,
    required this.isFinish,
    required this.isExperience,
    required this.startDateMonth,
    required this.startDateYear,
  });

  static ExperienceModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ExperienceModel(
      snapshot["descriptions"],
      snapshot["finishDateMonth"],
      snapshot["finishDateYear"],
      name: snapshot["name"],
      location: snapshot["location"],
      title: snapshot["title"],
      isFinish: snapshot["isFinish"],
      isExperience: snapshot["isExperience"],
      startDateMonth: snapshot["startDateMonth"],
      startDateYear: snapshot["startDateYear"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "location": location,
        "descriptions": descriptions,
        "isFinish": isFinish,
        "isExperience": isExperience,
        "startDateMonth": startDateMonth,
        "startDateYear": startDateYear,
        "finishDateMonth": finishDateMonth,
        "finishDateYear": finishDateYear,
      };
}
