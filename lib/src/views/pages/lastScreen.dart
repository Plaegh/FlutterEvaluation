import 'package:flutter/material.dart';
import 'package:flutter_evaluation/src/views/pages/firstScreen.dart';
import '../../model/student.dart';
import '../../model/serviceModel.dart';
import 'package:provider/provider.dart';


class EditStudent extends StatefulWidget {
  final Student student;

  EditStudent({@required this.student});

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String age;
  String birthday;
  String school;
  String studentID;

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<ServiceModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Edit Product Details'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.student.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Student name',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Student name';
                    }
                    return null;
                  },
                  onSaved: (value) => name = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.student.age,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Age',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Age';
                    }
                    return null;
                  },
                  onSaved: (value) => age = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.student.birthday,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Birthday',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Birthday';
                    }
                    return null;
                  },
                  onSaved: (value) => birthday = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.student.school,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'School',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter School';
                    }
                    return null;
                  },
                  onSaved: (value) => school = value
              ), SizedBox(height: 16,),
              TextFormField(
                  initialValue: widget.student.studentID,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'ID',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  onSaved: (value) => studentID = value
              ), SizedBox(height: 16,),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await studentProvider.updateStudent(Student(name: name, age: age, birthday: birthday, school: school, studentID: studentID), widget.student.id);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) => HomeScreen()));
                  }
                },
                child: Text('Edit Student', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}
