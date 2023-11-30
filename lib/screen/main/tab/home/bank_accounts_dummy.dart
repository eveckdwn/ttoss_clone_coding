import 'dart:collection';

import 'package:fast_app_base/common/dart/extension/collection_extension.dart';
import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 3000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(bankShinhan, 30000000, accountTypeName: "저축예금");
final bankAccountShinhan3 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountToss = BankAccount(bankTtoss, 5000000);
final bankAccountKakao = BankAccount(bankKakao, 7000000, accountTypeName: "입출금통장");

final bankAccountKakao2 = BankAccount(bankKakao, 1000000, accountTypeName: "특별통장");

//List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao
];

//Map
final bankMap = {
  "shinhan1": bankAccountShinhan1,
  "shinhan2": bankAccountShinhan2,
};

//Set
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao
};

main() {
  //  생성
  final list = [];
  final set = {bankAccountShinhan1, bankAccountShinhan2};
  final map = {"shinhan1": bankAccountShinhan1, "shinhan2": bankAccountShinhan2};

  //  List
  //  삽입
  bankAccounts.insert(1, bankAccountKakao2);

  //  위치 이동
  final temp = bankAccounts.removeAt(4);
  bankAccounts.insert(0, temp);

  //  교환
  bankAccounts.swap(0, 5);

  for(final account in bankAccounts) {
    print(account.toString());
  }

  //  변환
  //  final banks = bankAccounts.mapIndexed((e, idx) => Row(children: [(idx+1).text.make()],)).toList();
  final banks = bankAccounts.map((e) {},);
  for(final bank in banks) {
    print(bank.toString());
  }

  //  Map
  final HashMap<String, BankAccount> map2 = HashMap<String, BankAccount>();
  map2["ttoss"] = bankAccountToss;
  map2["kakao"] = bankAccountKakao;

  map2.putIfAbsent("kakao", () => bankAccountKakao2);

  if(!map2.containsKey("kakao")) {
    map2["kakao"] = bankAccountKakao2;
  }

  //  Set
  final newBanks = bankAccounts.map((e) => e.bank).toList();
  final uniqueBanks = banks.toSet();
  for(final bank in uniqueBanks) {
    print(bank.toString());
  }

  // class generic
  final result = doTheWork();
  print(result);
  final result2 = doTheWork2();
  print(result2);

  //method or function generic
  final result3 = doTheWork3<Dog>(() => Dog());
}

class Result<T> {
  final T data;

  Result(this.data);
}

class ResultString {
  final String data;
  ResultString(this.data);
}

class ResultDouble {
  final double data;
  ResultDouble(this.data);
}

Result<String> doTheWork() {
  ///...1
  ///...2
  ///
  ///...4
  return Result("중요한 데이터");
}

Result<double> doTheWork2() {
  ///...1
  ///...2
  ///
  ///...4
  return Result(5234.44);
}

abstract class Animal {

}

class Cat extends Animal {

}

class Dog extends Animal {

}

Result doTheWork3<Result extends Animal>(Result Function() animalCreator) {
  return animalCreator();
}