
import 'note_model.dart';

class NoteResponseModel {
  List results;
  bool error;
  String message;

   NoteResponseModel({
    required this.results,
    required this.error,
    required this.message
  });

  factory NoteResponseModel.fromJson(Map<String, dynamic> json) {
    return NoteResponseModel(
      results: (json['results'] as List).map((item) => NoteModel(
          id: item['id'],
          title: item['title'],
          description: item['description'],
          createdAt: DateTime.tryParse(item['createdAt']),
          updatedAt: item['updatedAt'] != null ? DateTime.tryParse(item['updatedAt']) : null,
      )).toList(),
      error: json['error'],
      message: json['message'],
    );
  }

  factory NoteResponseModel.withError(Map<String, dynamic> json) {
    return NoteResponseModel(results: [], error: true, message: json['message']);
  }
}