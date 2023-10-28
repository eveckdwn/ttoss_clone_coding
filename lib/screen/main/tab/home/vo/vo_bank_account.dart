import 'vo_bank.dart';

class BankAccount {
  final Bank bank;
  // final String accountNumber;
  // final String accountHolderName;
  int balance;
  final String? accountTypeName;

  BankAccount(
    this.bank,
    // this.accountNumber,
    // this.accountHolderName,
    this.balance, {
    this.accountTypeName,
  });
}
