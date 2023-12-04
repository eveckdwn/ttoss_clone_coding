import '../../../common/dart/collection/sort_functions.dart';

main() {
  /// Lambda의 표현 설명
  /// (int 파라미터1, String 파라미터2) => 반환값

  int add(int a, int b) {
    return a + b;
  }

  int add1(int a, int b) => a + b;

  final add2 = (int a, int b) => a + b;

  /// add1과 add2 비교
  /// 동일한 기능을 하지만,
  /// add1은 선언된 함수 자체에 이름이 확실히 매핑이 되어 있음.
  /// add2는 원래는 이름이 없지만, 변수에 담겨 있음. 하지만 일반적으로 변수에 Lambda 를 선언 하는 경우는 없다.

  /// Lambda의 특징 설명
  /// 1. 익명: 이름을 지을 수 없다. (변수에 담을 수 있음)
  // final add3 = add4(int a, int b) => a + b; // 불가능
  /// 2. 함수: Class에 종속되지 않음
  //  Lambda 를 변수에 선언했다는 것은 종속되었다기보다 Animal.add 변수에 저장된 것 뿐이다.
  final animal = Animal(1, '고양이');
  final addFunction = animal.add;

  /// 3. 전달: 1급 객체로서 함수 파라미터로 전달, 변수에 저장 가능
  run(add2, 1, 3);

  /// 4. 간결성: 익명 클래스처럼 많은 코드를 구현할 필요가 없다.
  //  retun 을 의미하는 화살표를 사용하는 순간부터 함수에 body 라고 표현되는 return 부분을 한줄로 표현 해야 한다.
  //  일반적인 중괄호({ })의 경우에는 다양한 Logic 들을 추가하면서 길게 사용할 수 있는데,
  //  화살표를 사용하는 순간부터는 세미콜론(;)로 모든 것을 끝내야 한다.

  /// List, Sort 예제
  final list = [5, 2, 4, 1, 3];
  list.sort();
  print(list);

  list.sort((a, b) => a == b
      ? 0
      : a < b
          ? 1
          : -1);
  print(list);


  final animalList = [Animal(5, '강아지'), Animal(3, '치타'), Animal(2, '토끼'), Animal(6, '하마'), Animal(20, '펭귄')];
  animalList.sort(byIntField<Animal>((element)=>element.age));
  print(animalList);

  animalList.sort(byIntField<Animal>((element)=>element.age, reverse: true));
  print(animalList);

  animalList.sort(byStringField<Animal>((element)=>element.name));
  print(animalList);

  animalList.sort(byStringField<Animal>((element)=>element.name, reverse: true));
  print(animalList);

  ///  Lambda 는 변수에 들어 있기도 하고, Lambda 의 함수 자체가 반환이 되는 리턴 타입이 되기 때문에 다양한 표현을 할 수 있고,
  ///  연달아 표현 되는 이 부분은 꼭 Lambda 여서가 아니라 Dart 의 구조상 Javascript 와 유사한 구조가 있다.
  ///  애초에 Dart 가 생격난 이유가 Javascript 대신 Web 에서 Programming 할 수 있는 Application 을 개발을 하기 위해서 이기 때문에
  ///  함수를 변수에 담을 수 있고, 함수가 Class 나 소속에 상관 없이 아예 최상위 밖으로 나올 수 있다.
  final add4 = (a) => (b) => a + b;
  final add5 = add4(2);
  print(add5(3));
  print(add4(2)(3));
}

void run(int Function(int a, int b) add2, int a, int b) {
  //  Lambda는 add2라는 변수에 의해서 넘어오게 될 것이고,
  //  이 넘어온 Lambda function을 위에서 수행하는게 아니라 나중에 우리가 원할 때 사용할 수 있다.
  final sum = add2(a, b);
}

class Animal {
  int age;
  final name;

  final add = (int a, int b) => a + b;

  Animal(this.age, this.name);

  void eat() {
    //  종속적으로 연결되었다는 것은 eat()가 Animal에 직접적인 영향을 줄 수 있다는 것이다.
    age++;
  }

  //  Lambda Function은 클래스와 관계없이 단독으로 수행되는 함수로 저장되는 것이고,
  //  이 함수 본인은 Animal에 있는지 다른 곳에 있는지 알 수 없다.
  //  final eat2 = () => age++; //  에러 발생
  //  final eat3 = () {  // 에러 발생
  //    age++;
  //  };

  @override
  String toString() {
    return "Animal: $age, $name";
  }
}
