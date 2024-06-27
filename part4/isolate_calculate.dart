import 'dart:isolate';

void main() async {
  print('Start of main');

  final receivePort = ReceivePort();
  await Isolate.spawn(doHeavyComputation, receivePort.sendPort);

  receivePort.listen((message) {
    print('Result from isolate: $message');
    receivePort.close();
  });

  print('End of main');
}

void doHeavyComputation(SendPort sendPort) {
  // CPU 집약적 작업 예제
  int result = 0;
  for (int i = 0; i < 1000000000; i++) {
    result += i;
  }
  sendPort.send(result);
}
