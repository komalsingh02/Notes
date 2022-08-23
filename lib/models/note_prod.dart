import 'package:flutter/cupertino.dart';

class Note{
  final String date;
  final String title;
  final String description;
  final String id;
  Note({required this.date,required this.title,required this.description,required this.id}); 
}

class NotrProd with ChangeNotifier{
  List<Note> lst=[];
  Future addNote(String id,String title,String desc,String date)async{
    lst.add(Note(date: date,title: title,description: desc,id: id));
  }
}