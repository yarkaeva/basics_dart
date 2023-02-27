import 'dart:io';

void main() {
  exampleOneFlow();
  exampleTwoReadingFile();

  final f1 = Future.delayed(Duration(seconds: 2));
  f1.whenComplete(() => print(1));
  final f2 = Future.delayed(Duration(seconds: 5));
  f2.whenComplete(() => print(2));

  final f3 = Future.wait([f1, f2]);
  f3.then((value) => print(3));
}

void exampleOneFlow() {
  print(1);
  print(2);
  print(3);
  // sleep(Duration(seconds: 10)); //ожидание, которое блокирует поток
  Future<Object?> waitingFuture =
      Future.delayed(Duration(seconds: 1)); // отложенное действие в будущем
  waitingFuture.then((_) => print(4));
  print(5);
  print(6);
  print(7);

  // хотя 1 секунда прошла, и 4 должно вывестись, оно не будет выводиться,
  // так как поток занят вычислением цикла:
  for (var i = 0; i < 99999; i++) {
    print(1);
    sleep(Duration(seconds: 1));
  }
}

void exampleTwoReadingFile() {
  print(1);
  final result = File('C:/Users/darin/Downloads/file.txt').readAsString();
  print(2);
  result.then((value) => print(value));
  print(3);
}
