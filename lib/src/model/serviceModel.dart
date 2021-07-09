import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_evaluation/src/controllers/apiServices.dart';
import 'package:flutter_evaluation/src/model/student.dart';
import '../../locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel extends ChangeNotifier {
  ApiServices apiServices = locator<ApiServices>();

  List<Student> students;


  Future<List<Student>> fetchStudents() async {
    var result = await apiServices.getDataCollection();
    students = result.docs
        .map((doc) => Student.fromMap(doc.data(), doc.id))
        .toList();
    return students;
  }

  Stream<QuerySnapshot> fetchStudentsAsStream() {
    return apiServices.streamDataCollection();
  }

  Future<Student> getStudentById(String id) async {
    var doc = await apiServices.getDocumentById(id);
    return  Student.fromMap(doc.data(), doc.id) ;
  }


  Future removeStudent(String id) async{
    await apiServices.removeDocument(id) ;
    return ;
  }
  Future updateStudent(Student data,String id) async{
    await apiServices.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addStudent(Student data) async{
    await apiServices.addDocument(data.toJson()) ;
    return ;

  }


}
