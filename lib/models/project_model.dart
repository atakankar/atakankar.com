import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  final String name;
  final String description;
  final bool status;
  final int order;
  final List<String> imageLinks;
  final String githubLink;
  final String language;

  const ProjectModel({
    required this.name,
    required this.description,
    required this.status,
    required this.order,
    required this.imageLinks,
    required this.githubLink,
    required this.language,
  });

  static ProjectModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ProjectModel(
      name: snapshot["name"],
      description: snapshot["description"],
      status: snapshot["status"],
      order: snapshot["order"],
      imageLinks: snapshot["imageLinks"],
      githubLink: snapshot["githubLink"],
      language: snapshot["language"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "status": status,
        "order": order,
        "imageLinks": imageLinks,
        "githubLink": githubLink,
        "language": language,
      };
}
