import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/serviceModel.dart';
import '../../model/student.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String age;
  String birthday;
  String school;
  String studentID;

  final dateController = TextEditingController();
  Future _selectDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate:DateTime.now(),
        firstDate:DateTime(1900),
        lastDate: DateTime.now());
    dateController.text = date.toString().substring(0,10);
  }
  @override
  Widget build(BuildContext context) {
    var studentProvider = Provider.of<ServiceModel>(context) ;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add Student'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Age',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter age';
                    }
                    return null;
                  },
                  onSaved: (value) => age = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  onTap: () {
                    _selectDate();
                  },
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Birthday',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter birthday';
                    }
                    return null;
                  },
                  onSaved: (value) => birthday = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'School',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter school';
                    }
                    return null;
                  },
                  onSaved: (value) => school = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Student ID',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Student ID';
                    }
                    return null;
                  },
                  onSaved: (value) => studentID = value
              ),
              SizedBox(height: 16,),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await studentProvider.addStudent(Student(name: name, age: age, birthday: birthday, school: school, studentID: studentID));
                    Navigator.pop(context) ;
                  }
                },
                child: Text('Add Student', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}
