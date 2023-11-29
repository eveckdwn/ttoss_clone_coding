class Bank {
  final String name;
  final String logoImangePath;

  Bank(this.name, this.logoImangePath);

  @override
  String toString() {
    return name;
  }

  @override
  bool operator ==(Object other) {
    if(identical(this, other)){
      return true;
    }
    if(other.runtimeType != runtimeType){
      return false;
    }
    return other is Bank && other.name == name;
  }
}