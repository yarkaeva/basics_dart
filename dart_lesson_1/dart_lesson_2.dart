// int c = 0;

// void main() {
// //   final result = sum (6,7);
// //   print(result);
// //   final c = 4;
// //     void sum2 () {
// //       c = c + 5;
// //       }

// //   print (c);
// //   sum();
// //   print(c);
// //   sum2();
// //   print(c);

//   int c =5;
//   final result = sum4(6);
//   print(result);

// }

// // void sum () {
// //   c = c + 4;

// // }

// // int sum3(int a, int b) => a + b;

// int sum4(int b) => c + b;

// Переменные бывают глобальными и локальными.
// Глобальная на самом высоком уровне вложения.
// Область видимости создается  фигурными собками.
// Область видимости наследуется. Всё, что объявлено в вышестоящей области будет видно в нижестоящей.
// 2 правило любая локальная область вилимости может создать внутри себя переменную
// с таким же именем как переменная выше неё самой. и Вместо вышейстоящей будет использовать переменную внутр и себя
// Переменная доступна там, где её определили(или переопределили) и ниже.
// Функция берёт переменную из того, места, где она объявлена, а не из того, где они вызываются.

/*
  Глобальная 
    fun main
      fun sum2
    sum
*/

// int timesTwo(int x) {
//   return x * 2;
// }

// int someName(int x){
//   return x*x;
// }

// int timesFour(int x) => timesTwo(timesTwo(x));

// int runTwice(int x, int Function(int) f) {
//     x = f(x);
//     x = f(x);
//   return x;
// }

// void main() {
//   print('4 times two is ${timesTwo(4)}');
//   print('4 times four is ${timesFour(4)}');
//   print('2 x 2 x 2 is ${runTwice(2, timesTwo)}');
//   print('2 x 2 x 2 is ${runTwice(2, someName)}');
//   final result = runTwice (4, (x) => x - x); //анонимное замыкание, функция без имени, исп-ся раз
//   print (result);

//   final sum = (int a, int b) {
//     return a+b;
//   };

//   sum (1,4);

// }
import 'dart:io';

void main() {
  // final a = 3;

  // if (a == 5) {
  //   print("5");
  // } else if (a == 4) {
  //   print("Не 5");
  // } else {
  //   print("хз, что за число");
  // }

// Управление потоком:

//   print('Введите число');

//   final line = stdin.readLineSync() ?? "";
//   final num = int.tryParse(line);
//   print(num);

//   if (num != null) {
//     if (num == 6) {
//       print("угадал");
//     } else if (num < 6) {
//       print("слишком мало");
//     } else {
//       print("слишком много");
//     }
//   } else {
//     print("введите ЧИСЛО!");
//   }
// }

  print('Введите число');

  final line = stdin.readLineSync() ?? "";
  final num = int.tryParse(line);

  switch (num) {
    case 6:
      print("Угадал");
      break;
    case 3:
      print("слишком много");
      break;
    default:
      print("хз хз");
  }
}
