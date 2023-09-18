import 'package:cloud_firestore/cloud_firestore.dart';

class SkillModel {
  final String name;
  final int level;
  final int order;

  const SkillModel({
    required this.name,
    required this.level,
    required this.order,
  });

  static SkillModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return SkillModel(
      name: snapshot["name"],
      level: snapshot["level"],
      order: snapshot["order"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "level": level,
        "order": order,
      };
}
