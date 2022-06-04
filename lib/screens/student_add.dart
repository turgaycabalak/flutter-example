import 'package:flutter/material.dart';
import '../models/Student.dart';

class StudentAdd extends StatefulWidget{
  late List<Student> students;

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }

}

class _StudentAddState extends State<StudentAdd>{
  var formKey = GlobalKey<FormState>();
  var student = Student("","",0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni ogrenci"),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ogrenci adi", hintText: "Ornek: Ayaz"),
      onSaved: (value){
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ogrenci soyadi", hintText: "Ornek: Armagan"),
      onSaved: (value){
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldigi not", hintText: "Ornek: 65"),
      onSaved: (value){
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton(){
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: (){
        formKey.currentState?.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }

}
