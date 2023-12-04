import 'dart:async';
import 'package:fast_app_base/class/ch04_advanced_dart1/future_test.dart';


const durationSample = Duration(seconds: 1);
const durationSample2 = Duration(seconds: 1);

main() {
  ///  Stream 기본 개념
  ///  Future - 1번의 데이터를 가져옴
  ///  Stream - 여러번의 데이터를 받을 수 있음

  ///  Stream 생성과 수행
  ///  1. async*
  // countStream(4).listen((event) {
  //   print(event);
  // });

  // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach((element) {
  //   print(element);
  // });

  ///  2. streamController
  // final controller = StreamController<int>();
  // final stream = controller.stream;
  // stream.listen((event) {
  //   print(event);
  // });
  // addDataToTheSink(controller);

  ///  Stream 데이터 변환
  // countStream(4).map((event) => '$event초가 지났습니다.',).listen((event) {
  //   print(event);
  // });

  ///  위젯에서 Stream Data 표현하기 → f_home.dart 참고

  ///  Stream 데이터 관찰2 - BroadcastStream
  // final broadCastStream = countStream(4).asBroadcastStream();
  // broadCastStream.listen((event) {
  //   print(event);
  // });

  ///  2개의 위젯에서 하나의 BroadcastStream  Data 표현하기
  // Future.delayed(durationSample2, (){
  //   broadCastStream.listen((event) {
  //     print('방송 2초 후: $event');
  //   });
  // });

  ///  Stream Error Handling
  // countStream(5).listen((event) {
  //   print(event);
  // }, cancelOnError: false).onError((error, stackTrace){
  //   print(error.toString());
  // });

  countStream(5).handleError((error){
    print(error);
  }).listen((event) {
    print(event);
  }, cancelOnError: false);
}

void addDataToTheSink(StreamController<int> controller) async {
  for (int i = 1; i <= 4; i++) {
    await sleepAsync(durationSample);
    controller.sink.add(i);
  }
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    if(i==2){
      yield* Stream.error(Exception("에러 발생"));
    }else{
      yield i;
    }
    await sleepAsync(durationSample);
  }
}
