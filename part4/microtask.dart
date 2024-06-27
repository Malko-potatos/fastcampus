import 'dart:async';

void main() {
  print('Start of main');

  Future(() => print('Future 1')).then((_) => print('Future 1 then'));
  Future(() => print('Future 2')).then((_) => print('Future 2 then'));

  // 마이크로 태스크 추가
  scheduleMicrotask(() => print('Microtask 1'));
  scheduleMicrotask(() => print('Microtask 2'));

  print('End of main');
}
