class  HabitModal{
  int id;
  String desc;
  DateTime startDate;
  int timePeriod;

  HabitModal({this.id, this.desc, this.startDate,this.timePeriod});

  factory HabitModal.fromMap(Map<String, dynamic> json)=>HabitModal(
    id: json['id'],
    desc: json['description'],
    startDate: DateTime.parse(json['startDate'].toString()),
    timePeriod: json['timePeriod']
  );

   Map<String, dynamic> toMap() => {
        "id": id,
        "description": desc,
        'startDate':startDate.toString(),
        'timePeriod': timePeriod
    };

  
}