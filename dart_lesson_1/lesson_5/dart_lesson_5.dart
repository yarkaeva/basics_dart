void main() {
  // Предположим, что нам нужно записать и хранить информацию о работниках,
  // для каждого работника придется создать большее количество переменных.
  // Не ясно, как хранить такие значения в массиве, к тому же легко ошибиться
  // в наименовании
  final emploeeOneName = 'Ivan';
  final emploeeOneSureName = 'Ivanov';
  final emploeeOnePassport = '0102 334455';
  final emploeeOneAge = 45;
  final emploeeOnesalary = [
    1000,
    1000,
    1000,
    1000,
    1500,
    1500,
    2000,
    2000,
    2000,
    2000,
    2000,
  ];
  // Можем завести словарь, так мы помещаем все данные в одну переменную.
  // Можем положить в массив. Но если значения разные, то словарь становиться
  // 'String: Object', теперь прежде, чем использовать значение, нужно обязптельно
  // изменить его тип. Здесь работает человеческий фактор, не забудет ли человек
  // записать какое-либо значение. Мы не гарантируем, что все работники будут
  // точно будут иметь все поля, можно описаться.
  final emploeeOne = {
    'name': 'Ivan',
    'sureName': 'Ivanov',
    'age': 45,
  };

  final Emploee one = Emploee(
    'Ivan',
    'Ivanov',
    '0102 334455',
    45,
    [1000, 1000, 1000, 1000, 1500, 1500, 2000, 2000, 2000, 2000, 2000],
  );

  final Emploee two = Emploee(
    'Pavel',
    'Pavlov',
    '0102 334466',
    21,
    [1000, 1000, 1000, 1000, 1500, 1500, 2000, 2000, 2000, 2000, 2000],
  );

  print(one); //выводит Instance of 'Emploee'
  print(one.name); //выводит Ivan
  one.name = 'Uri';
  print(one.name); //выводит Uri

  final list = [one, two]; // с экземплярами класса можно создать список
  print(list.first.age);

  final result = middleSalary(one);
  print(result);

  final result2 = one.middleSalary();
  print(result2);

  final square = Square(40);
  print(square);

  final squareWrong = Square.wrong(40, 120);
  print(squareWrong);

  final square2 = Square2(45);
  print(square2);
  print(square2.square);
}

// таким образом, мы создаем свой тип данных, который может хранить другие типы
// данных.

class Emploee {
//   конструктор
  Emploee(this.name, this.surname, this.passport, this.age, this.salary);

  // свойства
  String name;
  final String surname;
  final String passport;
  final int age;
  final List<int> salary;
  final int hight = 5;

// методы
  double middleSalary() {
    if (this.salary.isEmpty) {
      return 0;
    }
    return this.salary.reduce((value, element) => value += element) /
        this.salary.length;
  }

  @override
  String toString() {
    return '$name $surname $passport $age $salary $hight';
  }
}

// Чтобы посчитать среднюю зарплату, можем задать глобальную функцию:
double middleSalary(Emploee emploee) {
  //если массив равен 0, то поделим на 0 и будет краш, поэтомупроверяем на ноль
  if (emploee.salary.isEmpty) {
    return 0;
  }
  return emploee.salary.reduce((value, element) => value += element) /
      emploee.salary.length;
}

class Square {
  // Square(this.lenght, this.weight);
  Square(int side)
      : lenght = side,
        weight = side;
  Square.wrong(this.lenght, this.weight);

  final int lenght;
  final int weight;

  @override
  String toString() {
    return 'lenght: $lenght, weight:$weight';
  }
}

class Square2 {
  Square2(this._side);

  final int _side;
  int get lenght => _side;
  int get weight => _side;
  int get square => lenght * weight; // вычисляемое свойство

  @override
  String toString() {
    return 'lenght: $lenght, weight:$weight';
  }
}
