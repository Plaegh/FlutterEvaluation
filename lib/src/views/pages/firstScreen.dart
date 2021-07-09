import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_evaluation/src/model/student.dart';
import 'package:provider/provider.dart';
import '../widgets/studentCard.dart';
import '../../model/student.dart';
import '../../model/serviceModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student> students;

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<ServiceModel>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addStudent');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text('Student List')),
      ),
      body: Container(
        child: StreamBuilder(
            stream: studentProvider.fetchStudentsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                students = snapshot.data.docs
                    .map((doc) => Student.fromMap(doc.data(), doc.id))
                    .toList();
                return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (buildContext, index) =>
                      StudentCard(studentDetails: students[index]),
                );
              } else {
                 return CircularProgressIndicator();
              }
            }),
      ),
    );

  }
}



