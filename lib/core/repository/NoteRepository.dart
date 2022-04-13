import 'package:rx_dart_notes/core/models/note_model.dart';import 'package:rx_dart_notes/core/models/note_response_model.dart';import 'package:rx_dart_notes/core/services/notes_service.dart';import 'dart:developer' as developer;class NoteRepository{  final NoteService _apiService = NoteService();  Future<NoteResponseModel> getNote(){    developer.log('GET NOTE', name: 'REPOSITORY');    return _apiService.getNotesResponseList();  }  Future<NoteResponseModel> createNote(NoteModel newNote) {    return _apiService.createOneNote(newNote);  }  updateNote(NoteModel updatedNote) {    developer.log('UPDATE NOTE', name: 'REPOSITORY');    return _apiService.updateOneNote(updatedNote);  }}