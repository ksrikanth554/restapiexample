import 'package:flutter/material.dart';

class NoteListModel{
  String noteId;
  String notename;
  DateTime createdDate;
  DateTime latestEditDate;

  NoteListModel({
    this.createdDate,
    this.latestEditDate,
    this.noteId,
    this.notename
  });
}