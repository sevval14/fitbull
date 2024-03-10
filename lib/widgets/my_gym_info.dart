class MyGymInfo{
  String name;
  String image;
  String capacity;
  List<MyGymActivities> activities ;
  List<MyTeacher> teachers ;



  MyGymInfo(this.name,this.image, this.capacity, this.activities,this.teachers);

}

class MyTeacher {
  String name;
  String photo;
  String contact;

  MyTeacher(this.name, this.photo, this.contact);


}

class MyGymActivities{
  String image;
  String name;
  String date;
  String price;

  MyGymActivities(this.image, this.name, this.date, this.price);

}

