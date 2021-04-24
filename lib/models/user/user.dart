class User{
  int id;
  String name,email,type;

  User(this.id, this.name, this.email, this.type);
    User.fromJson(Map <String,dynamic> map) {
    this.id=map['id'];
    this.name=map['name'];
    this.email=map['email'];
    this.type=map['type'];
  }
}