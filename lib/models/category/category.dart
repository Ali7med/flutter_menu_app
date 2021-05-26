class Category{
  int _id;
  String _name,_note ;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Category(this._id, this._name,this._note);
  Category.fromJson(Map <String, dynamic> map){
    this._id=map['id'];
    this._name=map['name'];
    this._note=map['note'];
  }

  String get name => _name;

  get description => _note;

  set description(value) {
    _note = value;
  }

  set name(String value) {
    _name = value;
  }
}