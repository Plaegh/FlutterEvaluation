import 'package:flutter/material.dart';
import '../../model/student.dart';
import '../../model/serviceModel.dart';
import 'lastScreen.dart';
import 'package:provider/provider.dart';

class StudentDetails extends StatelessWidget {
  final Student student;

  StudentDetails({@required this.student});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<ServiceModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
        actions: <Widget>[

          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              await studentProvider.removeStudent(student.id);
              Navigator.pop(context);
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (_) => EditStudent(student: student,)));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Name: ${student.name} ',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 20,),
            Text(
              'Age: ${student.age} ',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 20,),
            Text(
              'Birthday ${student.birthday} ',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 20,),
            Text(
              'School: ${student.school} ',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 20,),
            Text(
              'ID: ${student.studentID} ',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  fontStyle: FontStyle.normal),
            ),
          ],
        ),
      ),
    );
  }
}

