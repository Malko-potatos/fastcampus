import 'dart:async';

void main() {
  print('Start of main');

  Future(() => print('Future 1')).then((_) => print('Future 1 then'));
  Future(() => print('Future 2')).then((_) => print('Future 2 then'));

  print('End of main');
}
