class NotesModel{

  int? id;
  String email;
  String password;

  NotesModel({required this.email,required this.password,this.id})

  NotesModel.fromMap(Map<String,dynamic>map){
    return NotesModel(email: map[email], password: map[password]);
  }
}