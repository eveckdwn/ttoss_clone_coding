class SimpleStock {
  final String name;

  SimpleStock(this.name);

  factory SimpleStock.fromJson(dynamic json){
    //  factory: 생성자와 비슷한 역할을 함 → 가공할 수 있는 어떤 파라미터를 가지고 필요한 생성차를 호출하여 그 객체를 돌려주는 역할.
    return SimpleStock(json["name"]);
  }

  @override
  String toString() {
    return name;
  }
}