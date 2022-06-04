import 'package:flutter/material.dart';
import 'package:flutter_app/models/Student.dart';
import 'package:flutter_app/screens/student_add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State {
  List<Student> students = [
    Student.withId(1, "Ayaz", "ARMAGAN", 95),
    Student.withId(2, "Nehir", "ARMAGAN", 42),
    Student.withId(3, "Turgay", "CABALAK", 25),
  ];

  Student selectedStudent = Student.withId(0, "hic", "kimse", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ogrenci takip sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName + " " + students[index].lastName),
                  subtitle: Text("Sinav notu : " + students[index].grade.toString() + "[" + students[index].getStatus + "]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://imgrosetta.mynet.com.tr/file/12771863/12771863-728xauto.jpg"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: (){
                    setState((){
                      this.selectedStudent = students[index];
                    });
                  },
                );
              }),
        ),
        Text("Secili ogrenci "+selectedStudent.firstName+" "+selectedStudent.lastName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                    onPrimary: Colors.black
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Yeni ogrenci")
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black12,
                    onPrimary: Colors.white
                ),
                onPressed: () {
                  print("Ogrenci guncellendi...");
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Guncelle")
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.black
                ),
                onPressed: () {
                  print("Ogrenci silindi...");
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Sil")
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if(grade >= 50){
      return Icon(Icons.done);
    } else if (grade >= 40){
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }

}
