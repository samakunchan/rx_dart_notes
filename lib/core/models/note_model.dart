class NoteModel {  int? id;  String title;  String description;  DateTime? createdAt;  DateTime? updatedAt;  NoteModel({    this.id,    required this.title,    required this.description,    this.createdAt,    this.updatedAt  });  factory NoteModel.fromJson(Map<String, dynamic> json) {    return NoteModel(      id: json['id'],      title: json['title'],      description: json['description'],      createdAt: json['createdAt'],      updatedAt: json['updatedAt'],    );  }}