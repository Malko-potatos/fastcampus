import 'dart:async';
import 'dart:isolate';

void main() async {
  print('Start of main');

  // 수신 포트 생성
  final receivePort = ReceivePort();

  Future(() => print('Future 2')).then((_) => print('Future 2 then'));

  scheduleMicrotask(() => print('Microtask 2'));

  // Isolate 생성 및 실행
  final isolate = await Isolate.spawn(isolateTask, receivePort.sendPort);

  // Isolate로부터 메시지 수신
  receivePort.listen((message) {
    print('Received from isolate: $message');
    receivePort.close(); // 수신 포트 닫기
    isolate.kill(priority: Isolate.immediate); // Isolate 종료
  });
  Future(() => print('Future 1')).then((_) => print('Future 1 then'));

  scheduleMicrotask(() => print('Microtask 1'));

  print('End of main');
}

void isolateTask(SendPort sendPort) {
  sendPort.send('Hello from isolate!');
}
