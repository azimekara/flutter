class Student
{
  late String firstName;
  late String lastName;
  late int grade;
  late String _status; //atta set edildiği için okuma yapılmaması için _ kullanıyoruz

  Student(String firstName,String lastName,int grade)
  {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  //firstName'deki get ve set örnek için yapıldı
  String get getfirstName //okuma yapmak için
  {
    return "OGR - " + this.firstName;
  }

  void set setfirstName(String value) //yazma yapmak için
  {
    this.firstName = value;
  }

  String get getStatus
  {
    String message = "";
    if(this.grade>=50)
    {
      message = "Geçti";
    }
    else if(this.grade>=40)
    {
      message = "Bütünlemeye Kaldı";
    }
    else
    {
      message = "Kaldı";
    }
    return message;
  }
}