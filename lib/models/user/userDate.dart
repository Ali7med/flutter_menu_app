class User{
  int id;
  String name,email,type;

  User(this.id, this.name, this.email, this.type);


    User.fromJson(Map <String,dynamic> x) {
    this.id=x['id'];
    this.name=x['name'];
    this.email=x['email'];
    this.type=x['type'];
  }
}