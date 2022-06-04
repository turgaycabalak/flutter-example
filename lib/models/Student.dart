class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status;

  Student(this.firstName, this.lastName, this.grade);

  Student.withId(this.id, this.firstName, this.lastName, this.grade);

  String get getStatus {
    if (this.grade >= 50) {
      this.status = "Gecti";
    } else if (this.grade >= 40) {
      this.status = "Butunlemeye kaldi";
    } else {
      this.status = "Kaldi";
    }
    return this.status;
  }
}
