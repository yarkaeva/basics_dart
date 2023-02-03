import 'dart:math';

void main() {
  final List<int> listOfInt = [2, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  for (var index = 0; index < listOfInt.length; index++) {
    print('$index: ${listOfInt[index]}');
  }

  for (var index = 0; index < listOfInt.length; index++) {
    if (listOfInt[index] % 2 == 0) {
      listOfInt.removeAt(index); //так не делать, см. README
    }
  }
  print(listOfInt);

  // for in
  for (final element in listOfInt) {
    print(element);
  }
  // эмитация счетчика из цикла for для for in
  var i = 0;
  for (final element in listOfInt) {
    print('${i++} $element');
  }
  // эмитация счетчика из цикла for для for in
  for (final element in listOfInt.asMap().entries) {
    print('${element.key}: ${element}');
  }

  for (final element in listOfInt) {
    var a = 0;
    a += element;
    print(a);
  }
  print(listOfInt);

  // цикл while, счетчик пульса
  var rng = Random();
  var heartBeat = 0;
  while (heartBeat < 120) {
    print('Всё хорошо');
    heartBeat = rng.nextInt(200);
  }
  print('Всё плохо');

  //  do while
  var heartBeat2 = 1;
  while (heartBeat2 < 1) {
    print('Всё хорошо 1');
    heartBeat2 = 1;
  }

  var heartBeat3 = 1;
  do {
    print('Всё хорошо 2');
    heartBeat3 = 1;
  } while (heartBeat3 < 1);
}
