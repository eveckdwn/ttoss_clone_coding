import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import '../../../screen/main/tab/home/vo/vo_bank_account.dart';
import '../../../screen/main/tab/home/vo/vo_user.dart';

main() {
  /// Function Programming

  /// 프로그래밍 방법을 부르는 이름들

  /// 절차적 프로그래밍 - 명령형 프로그래밍
  /// 어떤 함수를 만들고 그 함수를 호출할 때, a를 실행하고 a의 결과물을 가지고, b, c 를 수행하고,
  /// User 가 무엇을 눌렀을 때, d를 실행하고, 순차적으로 하나하나 모든 것을 일일이 코딩하는 것

  /// 이렇게 절차적 프로그래밍을 하다보면 Boilerplate code 라고하는 부수적이고 불필요한 코딩을 할 때가 있다.
  ///

  /// 함수형 프로그래밍 - 선언형 프로그래밍

}

List<BankAccount> getAccounts() {
  return bankAccounts;
}

User getUser(int id) {
  return switch (id) {
    1 => User(id, 'Jason'),
    2 => User(id, 'Dart'),
    3 => User(id, 'Baby'),
    4 => User(id, 'Love'),
    5 => User(id, 'Popcorn'),
    _ => throw Exception('404 not found')
  };
}