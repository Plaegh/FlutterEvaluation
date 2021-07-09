class Student {
  String id;
  String name;
  String age;
  String school;
  String birthday;
  String studentID;

  Student({this.id, this.name, this.age, this.school, this.birthday, this.studentID});

  Student.fromMap(Map snapshot,String id) :
        id = id ?? '',
        name = snapshot['name'] ?? '',
        age = snapshot['age'] ?? '',
        school = snapshot['school'] ?? '',
        birthday = snapshot['birthday'] ?? '',
        studentID = snapshot['studentID'] ?? '';

  toJson() {
    return {
      "name": name,
      "age": age,
      "school": school,
      "birthday":   birthday,
      "studentID":  studentID,
    };
  }
}