class Language{
  int id,rtl;
  String name,note,locale,curr_sign;
  Language(this.id, this.name,this.note,this.locale,this.curr_sign,this.rtl);

  Language.fromJson(Map <String,dynamic> map){
    this.id=map['id'];
    this.name=map['name'];
    this.note=map['note'];
    this.locale=map['locale'];
    this.curr_sign=map['curr_sign'];
    this.rtl=map['rtl'];
  }
}