curry(Function f) => (a, {Iterable? args}) => (args?.length ?? 0) > 1 ? f(a, args) : (b) => f(a, b);

main() {
  ///  커리 F => 함수 자체를 쪼개주는 역할
  ///  final curryFunction= curry(F(a, b))
  ///  curryFuction(a)(b)

  // final result = multiply(2, 3);
  // print(result);
  // print(curryMultiply(2)(3));
  // print(curryMultiply(3)(6));

  final multiply2 = curryMultiply(2); //  함수를 쪼개서 합성함수를 만들 수 있다.

  for(int i = 1; i <= 10; i++){
    print(multiply2(i));  //  curryMultiply(2)(i) 연산이 진행된다.
  }
}

final multiply = (int a, int b) => a * b;

final curryMultiply = curry(multiply);