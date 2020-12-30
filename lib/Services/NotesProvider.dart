import 'package:flutter/material.dart';

import 'db.dart';
import 'package:digital_wallet/Models/JournalNotes.dart';

class NotesProvider with ChangeNotifier {
  DBProvider db;
  List<JournalNotes> _note;

  NotesProvider() {
    db = DBProvider.db;

    notifyListeners();
  }

  List<JournalNotes> get notes => _note;

  updateNotes() async {
    _note = await db.getNoteList();
    notifyListeners();
  }

  updateNote(JournalNotes note  ) async 
  {
    await db.updateNote(note);
    updateNotes();
  }

  addNotes(JournalNotes n) async {
    await db.insertNote(n);
    updateNotes();
  }

  deleteNotes(JournalNotes n) async {
    await db.deleteNote(n.id);
    updateNotes();
  }
}
