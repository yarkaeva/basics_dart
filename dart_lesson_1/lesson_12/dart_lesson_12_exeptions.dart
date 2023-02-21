void main() {
  // final a = division('5', 'ноль');
  // print(a);

// ошибки можно ловить и обрабатывать
//   try {
//     print('fffff');
//     final a = division('5', 'jhj');
//     final b = a + 6;
//     print(b);
//   } catch (error) {
//     print(error);
//   }
// }

// В этом примере обрабатываем конкретные ошибки по отдельности
  try {
    print('fffff');
    final a = division('-5', '5');
    final b = a + 6;
    print(b);
  } on DivisionByZero catch (error) {
    print(error);
  } on IncorrectIntString catch (error) {
    print(error);
  } catch (error) {
    print("Неопознанная ошибка: $error");
  } finally {
    //блок кода, который выполняется всегда, даже если выше есть ошибки
    print('Выполнение блока finally');
  }
}

// вариант 1 функция
// double division(String a, String b) => int.parse(a) / int.parse(b);

// Ошибки
// Мы можем создавать свои ошибки. тк ошибки - это класс, то можем делать с
// ними всё, что делаем с другими классами
class IncorrectIntString {
  IncorrectIntString(this.incorrectString);
  final String incorrectString;

  @override
  String toString() {
    return "Нельзя преобразовать строку в int. Некорректная строка $incorrectString";
  }
}

class DivisionByZero {
  @override
  String toString() {
    return "Произошло деление на 0";
  }
}

class NegativeDouble {
  NegativeDouble(this.incorrectDouble);

  final double incorrectDouble;
  @override
  String toString() {
    return 'Число является отрицательным. Значение числа: $incorrectDouble';
  }
}

// вариант 2
double division(String a, String b) {
  final aa = int.tryParse(a);
  final bb = int.tryParse(b);

// мы можем выбрасывать ошибки
  if (aa == null) {
    return throw IncorrectIntString(a);
  }

  if (bb == null) {
    return throw IncorrectIntString(b);
  }

  if (bb == 0) {
    return throw DivisionByZero();
  }

  final result = inSquare(aa / bb);
  return result;
}

double inSquare(double a) {
  if (a < 1) {
    throw NegativeDouble(a);
  }
  return a * a;
}
