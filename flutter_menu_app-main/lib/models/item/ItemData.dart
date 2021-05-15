class Item{
  int LanguageID ,CategoryID,ItemID;
  String ItemName,photo;

  Item(this.LanguageID, this.CategoryID, this.ItemID, this.ItemName,this.photo);

  Item.fromJson(Map<String,dynamic>map){
    this.LanguageID=map['LanguageID'];
    this.CategoryID=map['CategoryID'];
    this.ItemID=map['ItemID'];
    this.ItemName=map['ItemName']; 
    this.photo=map['photo'];
  }
}