class User{
  String name;
  String dob;
  String gender;
   User({this.name, this.dob, this.gender, });

  factory User.fromMap(Map<String, dynamic> json) => new User(
    
    name:  json['name'],
    dob: json['dob'],
    gender: json['gender'],
    


  );

  Map<String, dynamic> toMap() => {
      'id':  1,
      'name': name,
      'dob':dob,
      'gender': gender,
   
  };
}
