import 'dart:async';

import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

void main() async {
  //  Future의 기본 개념
  /// Future == 미래
  ///  시간이 걸리는 Computation 작업 또는 유저의 응답을 기다려야되는 상태

  //  Future의 생성과 수행
  print('Start');
  getBankAccounts().then((value){
    print(value.toString());
  });
  print('End');
  /// 출력 결과
  /// Start
  /// End
  /// BankAccounts() 메서드로 리턴된 BankAccount List

  print('Start');
  final accounts = await getBankAccounts();
  print(accounts.toString());
  print('End');
  /// 출력 결과
  /// Start
  /// BankAccounts() 메서드로 리턴된 BankAccount List
  /// End

  //  Future Timeout
  const durationSample = Duration(seconds: 1000);
  print('Start');
  final result = await getBankAccounts().timeout(durationSample).onError((error, stackTrace) => [
  ]);
  print(result);
  print('End');

  //  Future Error Handling
  //  가능하면 then 보다는 await을 사용하는 것을 추천한다.
  print('Start');
  try {
    final result1 = await getBankAccounts().timeout(durationSample);
    print(result1);
  }catch(error) {
    print(error);
  }
  print('End');

  print('Start');
  final result2 = await getBankAccounts().timeout(durationSample).then((value) {
    print(value);
  }).catchError((error, stackTrace){
    print(error);
    print(stackTrace);
  });
  print(result);
  print('End');
}

//  FutureOr
abstract class DoWorkInterface1 {
  FutureOr doWork();
}

class SyncWork1 extends DoWorkInterface1 {
  @override
  void doWork() {

  }
}

class AsyncWork1 extends DoWorkInterface1 {
  @override
  Future doWork() async {

  }
}

abstract class DoWorkInterface2 {
  FutureOr<String> doWork();
}

class SyncWork2 extends DoWorkInterface2 {
  @override
  String doWork() {
    return "wow";
  }
}

class AsyncWork2 extends DoWorkInterface2 {
  @override
  Future<String> doWork() async {
    return "";
  }
}

Future<List<BankAccount>?> getBankAccounts() async {
  return bankAccounts;
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}