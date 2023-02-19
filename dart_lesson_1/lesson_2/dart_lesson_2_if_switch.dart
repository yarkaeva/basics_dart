import 'dart:io';

void main() {
  final a = 3;

  if (a == 5) {
    print('5');
  } else if (a == 4) {
    print('Не 5');
  } else {
    print('хз, что за число');
  }

  print('Введите число');

  final line = stdin.readLineSync() ?? "";
  final num = int.tryParse(line);
  print(num);

  if (num != null) {
    if (num == 6) {
      print('угадал');
    } else if (num < 6) {
      print('слишком мало');
    } else {
      print('слишком много');
    }
  } else {
    print('введите ЧИСЛО!');
  }

  print('Введите число');

  final line2 = stdin.readLineSync() ?? "";
  final num2 = int.tryParse(line2);

  switch (num2) {
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
