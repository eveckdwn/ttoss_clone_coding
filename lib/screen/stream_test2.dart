import 'future_test.dart';

const durationSample = Duration(seconds: 1);

void main() async {
  /// List와 Iterable
  /*
  final List list = ['red', 'green', 'blue', 'orange', 'pink'];
  final iterator = list.iterator;
  print(iterator.current);

  while(iterator.moveNext()){
    print(iterator.current);
  }

  list.forEach((element) {
    print(element);
  });

  for(final number in [1,2,3,4,5]){
    print(number);
  }
  */

  /// sync*로 Iterable 만들기
  // for(final message in countIterable(5)){
  //   print(message);
  // }

  /// async*로 Stream 만들기
  // countStream(5).listen((event) {
  //   print(event);
  // }, cancelOnError: false).onError((error, stackTrace){
  //   print(error.toString());
  // });

  await for (final message in countStream(3)){
    print(message);
  }

  /// yield*를 통해서 Iterable & Stream 연장시키기
}

Iterable<String> countIterable(int max) sync* {
  for (int i = 1; i <= max; i++) {
    // sleep(durationSample);
    ///  flutter 에서 dart.io에 있는 sleep 함수를 사용하면 큰일난다.
    ///  이 함수가 동작을 하는 CPU thread 를 아예 멈추게 된다.
    ///  dart flutter 에서 우리가 수행을 하는 코드는 모두 UI thread 라는 main thread 에서 수행이 되는데,
    ///  이런 식으로 io에 있는 sleep 함수를 직접 사용을 하게 되면,
    ///  animation 이나 ui touch 등 main thread 가 감당을 해야 하는 작업이 멈춰 버리게 된다.
    yield i.toString();
  }
  yield '새해 복 많이 받으세요';

  /// yield*는 Iterable<T>를 확장시키는 역할을 한다.
  yield* ['1', '2', '3', '4', '5'];
  // yield* countIterable(max);
}

/// Generator: 어떤 데이터를 지속적으로 계속 생산한다.

Stream<String> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await sleepAsync(durationSample);
    yield i.toString();
  }
  yield '새해 복 많이 받으세요';
  // yield* countStream(to);
}
