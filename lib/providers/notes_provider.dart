import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_web/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';

class Note {
  final String name;
  final DateTime date;
  final String text;

  Note({required this.name, required this.date, required this.text});
}

class NotesProvider extends ChangeNotifier {
  final FirebaseFirestore _fstore = FirebaseFirestore.instance;
  String userId = Provider.of<SignUpProvider>(context as BuildContext).uid;
  List<Note> _notes = [];

  Stream<List<Note>> get notesStream {
    return _fstore.collection("users").doc(userId).snapshots().map(
      (val) {
        final data = val.data();

        if (data!.containsKey("notes")) {
          final dataList = data["notes"];
          final notes = dataList
              .map((snapshot) => Note(
                  name: snapshot['name'],
                  date: snapshot['date'].toDate(),
                  text: snapshot["text"]))
              .toList();

          _notes = notes;
          notifyListeners();
          return notes;
        } else {
          _notes = [];
          notifyListeners();
          return [];
        }
      },
    );
  }

  List<Note> get notes => _notes;
}
