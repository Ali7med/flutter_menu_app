class Language{
  int Id;
  String Name,Description;
  Language(this.Id, this.Name,this.Description);

  Language.fromJson(Map <String,dynamic> map){
    this.Id=map['ID'];
    this.Name=map['NAME'];
    this.Description=map['Description'];
  }
}