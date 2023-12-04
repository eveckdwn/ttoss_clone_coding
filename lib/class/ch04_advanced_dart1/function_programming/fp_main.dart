import 'dart:async';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import '../../../screen/main/tab/home/vo/vo_bank_account.dart';
import '../../../screen/main/tab/home/vo/vo_user.dart';

main() async {
  /// Function Programming

  /// 프로그래밍 방법을 부르는 이름들

  /// 절차적 프로그래밍 - 명령형 프로그래밍
  /// 어떤 함수를 만들고 그 함수를 호출할 때, a를 실행하고 a의 결과물을 가지고, b, c 를 수행하고,
  /// User 가 무엇을 눌렀을 때, d를 실행하고, 순차적으로 하나하나 모든 것을 일일이 코딩하는 것
  /// 이렇게 절차적 프로그래밍을 하다보면 Boilerplate code 라고하는 부수적이고 불필요한 코딩을 할 때가 있다.
  //  Accounts => Users => User.name => 출력
  final accounts = getAccounts();
  final list = <String>[];
  for (final account in accounts) {
    final user = getUser(account.userId);
    list.add(user.name);
  }
  print(list);

  final accounts1 = await futureGetAccounts();
  final list1 = <String>[];
  for (final account in accounts1) {
    final user = await futureGetUser(account.userId);
    list1.add(user.name);
  }
  print(list1);

  /// 함수형 프로그래밍 - 선언형 프로그래밍
  /// 절차적 프로그래밍 보다 실수를 줄일 수 있고, 가독성이 더 좋다고 생각한다. (강사님 피셜)
  final nameList = getAccounts()
      .map(accountToUserId)
      .map(userIdToUser)
      .map(userToName)
      .toList();
  print(nameList);

  print('nameList2 start');
  final nameList2 = (await futureGetAccounts())
      .map(accountToUserId)
      .map(userIdToUser)
      .map(userToName)
      .toList();
  print(nameList2);
  print('nameList2 end');

  print('nameList3 start');
  final nameList3 = await (await futureGetAccounts())
      .toStream()
      .map(accountToUserId)
      .asyncMap(userIdToFutureUser)
      .map(userToName)
      .toList();
  print(nameList3);
  print('nameList3 end');
}

FutureOr<User> userIdToFutureUser(userId) => (futureGetUser(userId));
String userToName(user) => user.name;
User userIdToUser(userId) => getUser(userId);
int accountToUserId(account) => account.userId;

List<BankAccount> getAccounts() {
  return bankAccounts;
}

Future<List<BankAccount>> futureGetAccounts() async {
  await sleepAsync(Duration(milliseconds: 300));
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

Future<User> futureGetUser(int id) async {
  await sleepAsync(Duration(milliseconds: 300));
  return switch (id) {
    1 => User(id, 'Jason'),
    2 => User(id, 'Dart'),
    3 => User(id, 'Baby'),
    4 => User(id, 'Love'),
    5 => User(id, 'Popcorn'),
    _ => throw Exception('404 not found')
  };
}
