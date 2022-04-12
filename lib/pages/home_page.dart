import 'package:flutter/material.dart';import 'package:rx_dart_notes/blocs/note_bloc.dart';import 'package:rx_dart_notes/core/models/note_model.dart';import 'package:rx_dart_notes/core/models/note_response_model.dart';import 'dart:developer' as developer;import 'package:rx_dart_notes/pages/save_notes_page.dart';class HomePage extends StatefulWidget{  const HomePage({Key? key}) : super(key: key);  @override  State<HomePage> createState() => _HomePageState();}class _HomePageState extends State<HomePage> {  // NoteService get service => GetIt.instance<NoteService>();  // late Future<NoteResponseModel> _apiResponseModel;  @override  void initState() {    bloc.getNote();    // _apiResponseModel = service.getNotesResponseList();    developer.log('Début', name: 'HOME PAGE INIT STATE');    // print(_apiResponseModel);    super.initState();  }  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(title: const Text('Listes des notes reactive'),),      floatingActionButton: FloatingActionButton(        child: const Icon(Icons.add),        onPressed: () {          developer.log('[Start] Bouton pressé', name: 'CONSOLE.LOG LIST');          Navigator              .of(context)              .push(MaterialPageRoute(builder: (_) => const SaveNotesPage()));          developer.log('[End] Bouton pressé', name: 'CONSOLE.LOG LIST');        },      ),      body: StreamBuilder<NoteResponseModel>(        stream: bloc.subject.stream,        builder: (context, AsyncSnapshot<NoteResponseModel> snapshot) {          var notes = snapshot.data != null ? snapshot.data?.results as List<NoteModel> : [];          // developer.log('Has error: ${snapshot.hasError}', name: 'HOME PAGE SNAPSHOT');          // developer.log('$notes', name: 'HOME PAGE SNAPSHOT');          // developer.log('Error: ${snapshot.data?.error}', name: 'HOME PAGE SNAPSHOT');          // developer.log('Message: ${snapshot.data?.message}', name: 'HOME PAGE SNAPSHOT');          return ListView.separated(              itemBuilder: (_, index) {                var date = notes[index].createdAt as DateTime;                return Dismissible(                    key: ValueKey(notes[index].id),                    onDismissed: (direction) {                    },                    confirmDismiss: (direction) async {                      // return await showDialog(context: context, builder: (_) => const DeleteNotesPresentation());                    },                    background: Container(                      color: Colors.red,                      padding: const EdgeInsets.only(left: 20),                      child: const Align(                        child: Icon(Icons.delete, color: Colors.white,),                        alignment: Alignment.centerLeft,                      ),                    ),                    secondaryBackground: Container(                      color: Colors.green,                      padding: const EdgeInsets.only(right: 20),                      child: const Align(                        child: Icon(Icons.archive, color: Colors.white,),                        alignment: Alignment.centerRight,                      ),                    ),                    child: ListTile(                      title: Text(                        notes[index].title,                        style: TextStyle(color: Theme.of(context).primaryColor),                      ),                      subtitle: Text('Paru le ${date.day.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.year}'),                      onTap: () {                        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => SaveNotesPresentation(                        //   note: notes[index],                        // )));                      },                    ));              },              separatorBuilder: (_, __) => const Divider(height: 1, color: Colors.green,),              itemCount: notes.length          );        },      ),    );  }}