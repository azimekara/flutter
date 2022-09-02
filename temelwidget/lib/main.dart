

import 'package:flutter/material.dart';
import 'package:temelwidget/models/student.dart'; //android tasarımı

void main()
{
  runApp(MaterialApp( //material standartlarında çalışılacağı söylendi
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ) ,
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget
{
  String mesaj = "Öğrenci Takip Sistemi";
  List<Student> students = [Student("Engin", "Demiroğ", 25),Student("Kerem", "Varış", 65),Student("Halil", "Duymaz", 45)];

  var ogrenciler = ["Engin Demirog","Kerem Varıs","Berkay Bilgin","Murat Kurtbogan"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold( // görünüm
      appBar: AppBar( //mavi kısım
        title: Text(mesaj),
      ),
      body: buildBody(context)

    );
  }
  String sinavHesapla(int puan)
  {
    String mesaj = "";
    if(puan>=50)
      {
        mesaj = "Geçti";
      }
    else if(puan>=40)
      {
        mesaj = "Bütünlemeye Kaldı";
      }
    else
      {
        mesaj = "Kaldı";
      }
    return mesaj;
  }

  void mesajGoster(BuildContext context,String mesaj)
  {
    var alert = AlertDialog(
      title: Text("Durum"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context)
  {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext, int index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg") ,
                    ),
                    title: Text(students[index].firstName + " " + students[index].lastName ),
                    subtitle: Text("Sınavdan aldığı not : " + students[index].grade.toString() + "["+students[index].getStatus + "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      print(students[index].firstName + " " + students[index].lastName);
                    },
                  );
                })
        ),
        Center(
            child: ElevatedButton(
              child: Text("Sonucu Gör"),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                var mesaj = sinavHesapla(55);
                mesajGoster(context,mesaj);
              },

            )
        ),
      ],
    );

  }

  Widget buildStatusIcon(int grade)
  {
    if(grade>=50)
    {
      return Icon(Icons.done);
    }
    else if(grade>=40)
    {
      return Icon(Icons.album);
    }
    else
    {
      return Icon(Icons.clear);
    }
  }
}