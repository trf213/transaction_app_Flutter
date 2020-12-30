class TodoModal{
  int id;
  String desc;
  bool isCompleted;
  String priorityLevel;
  DateTime dueDate;
  



  TodoModal({this.id,this.desc,this.isCompleted, this.priorityLevel ,this.dueDate});

  factory TodoModal.fromMap(Map<String, dynamic> json)=>TodoModal(
    id: json['id'],
    desc: json['description'],
    isCompleted: (json['isCompleted'].toString().toLowerCase() == 'true')? true:false,
    dueDate: DateTime.parse(json['dueDate'].toString()),
    priorityLevel: json['priorityLevel']
  );

   Map<String, dynamic> toMap() => {
        "id": id,
        "description": desc,
        'dueDate':dueDate.toString(),
        'isCompleted': isCompleted.toString(),
        'priorityLevel': priorityLevel.toString()

    };
}