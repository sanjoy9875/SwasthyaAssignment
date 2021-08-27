class User{
  int? _id;
  String? _rate;
  String? _temperature;
  String? _oxygen;
  String? _date;

  User(this._rate,this._temperature,this._date,this._oxygen);

  User.withId(this._id,this._rate,this._temperature,this._oxygen,this._date);

  int? get id => _id;
  String? get rate => _rate;
  String? get temperature => _temperature;
  String? get oxygen => _oxygen;
  String? get date => _date;

  set rate(String? newRate){
      if(newRate!.length<=255){
        this._rate = newRate;
      }
  }

   set temperature(String? newTemperature){
      if(newTemperature!.length<=255){
        this._temperature = newTemperature;
      }
  }

   set date(String? newDate){
      if(newDate!.length<=255){
        this._date = newDate;
      }
  }

  set oxygen(String? newOxygen){
      if(newOxygen!=null){
        this._oxygen = newOxygen;
      }
  }

//convert a Movie object into a Map object
  Map<String, dynamic> toMap(){
    var map = Map<String ,dynamic>();

    if(id!=null){
      map['id'] = _id;
    }
    map['rate'] = _rate;
    map['temperature'] = _temperature;
    map['oxygen'] = _oxygen;

    return map;
  }

//extract a Movie object from a Map object
  User.fromMapObject(Map<String,dynamic> map){
    this._id = map['id'];
    this._rate = map['rate'];
    this._temperature = map['temperature'];
    this._oxygen = map['oxygen'];
    this._date = map['date'];
  }

}