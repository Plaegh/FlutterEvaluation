import 'package:flutter/material.dart';
import '../../model/student.dart';
import '../pages/thirdScreen.dart';

class StudentCard extends StatelessWidget {
  final Student studentDetails;

  StudentCard({@required this.studentDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => StudentDetails(student: studentDetails)));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height * 0.35,
            // width: MediaQuery
            //     .of(context)
            //     .size
            //     .width * 0.9,
            //   constraints: BoxConstraints(
            //     minWidth: MediaQuery.of(context).size.width,
            //     minHeight: MediaQuery.of(context).size.height,
            //   ),
            child: Padding(
              padding: EdgeInsets.all(16),
            child: new Row(
              children: <Widget>[
                new Expanded (
                  flex:1,
                  child : Column(
                    children: <Widget>[
                      Text("Name: ${studentDetails.name}",
                        overflow: TextOverflow.fade,
                      style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      fontStyle: FontStyle.normal),
                      ),
                      SizedBox(height: 16,),
                      Text("Age:  ${studentDetails.age}",
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(height: 16,),
                      Text("Birthday:  ${studentDetails.birthday}",
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(height: 16,),
                      Text("School:  ${studentDetails.school}",
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(height: 16,),
                      Text("ID:  ${studentDetails.studentID}",
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            fontStyle: FontStyle.normal),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          Icon(
                            Icons.info,
                            color: Colors.blue,
                            size: 30.0,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    ),
  );
 }
}