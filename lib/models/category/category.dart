class Category{
  int Id;
  String Name,Description ;

  Category(this.Id, this.Name,this.Description);
  Category.fromJson(Map <String, dynamic> map){
    this.Id=map['CategoryID'];
    this.Name=map['CategoryName'];
    this.Description=map['CategoryDescription'];
  }
}