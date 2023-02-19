void main() {
  final a = 4;
  final List<int> listOfInt = [
    1,
    2,
    3,
    4,
    3,
    3,
    8,
    15,
  ];

// print(listOfInt.runtimeType);
// если список пустой, то программа крашнется, поэтому нужно делать проверку
  if (listOfInt.isNotEmpty) {
    print(listOfInt.first);
    print(listOfInt.last);
  } else {
    print('список пуст');
  }

//   если указать индекс, которого нет в массиве -  краш. Исправить можно проверкой на длину:

  if (listOfInt.length >= 8) {
    print(listOfInt[0]);
    print(listOfInt[7]);
  } else {
    print('список пуст');
  }

  //создает новый перевернутый список, не переворачивает оригинальный
  print(listOfInt);
  print(listOfInt.reversed);

  List<Object> listOfInt2 = [1, 2];

  listOfInt2.add(7); // добавляем в конец 1 значение
  listOfInt2.addAll([3, 4]); // добавляем в конец несколько значений

  print(listOfInt2.first.runtimeType);
  print(listOfInt2.runtimeType);

  List<Object> castExample = [a];
  final newList = castExample.cast<int>(); // меняет тип на int
  final f = newList.first + 3;
  print(f);

  List<int> list = [1, 10, 2, 6, 5];
  //.fillRange заменяет значения в массиве (изменяет его) в промежутке от 1 до 3 (1 включительно, 3 невключительно), 10 -  на что заменить
  list.fillRange(1, 3, 10);

  //.getRange вытаскивает значения из массива в промежутке от 1 до 3 (1 включительно, 3 невключительно)
  final newList2 = list.getRange(1, 3);
  print(list);
  print(newList2);

  final newList3 = list.indexOf(6);
// (6)вытаскивает индекс значения 6, если 6 повторяется, то вытащит индекс первого
  final newList4 = list.indexWhere((element) => false);
  final newList7 = list.indexWhere(
      (element) => element - 3 == 2); // находит первый элемент по условию
  list.insert(0,
      9); //в нулевой индкес вставляем значение 9,изменяем массив. Если указатиь несуществующий индекс - краш

  print(newList3);
  print(list);

  final fff = [1, 10, 2, 6, 5];

  print(list == fff);
  // так нельзя сравнить содержимое, он сравнит один ли этот список (нет), и всегда будет выдавать false

  // print(ListEquality().equals(list, fff)); // сравнивает содержимое, при положительном результате true

  list.remove(5); // удаляет значение
  print(list);

  final listOfInt5 = const [2, 4, 2, 6, 2];
  final result = listOfInt5.join(',');
  print(result);

// создает новый список, пройдется по всему массиву и добавит к каждому элементу 5
// без .toList() тип ddd - MappedListIterable<int, int>
  final ddd = listOfInt5.map((e) => e + 5).toList();
  print(ddd);

// Map иметь доступ к значению по ключу, ключи не должны совпадать

  final Map<String, String> mapOfPeople = {
    '0102 344555': 'Ivanov V',
    '0102 456709': 'Faina U',
    '0102 903890': 'Ydashkin R',
    '0102 90385': 'Varlamov F',
  };

  final List<String> listOfPeople = [
    'Ivanov V',
    'Faina U',
    'Ydashkin R',
    'Varlamov F',
  ];

  mapOfPeople.containsKey('0102 344555');
  // поиск по ключу расходует мало ресурсов, значительно меньше, чем сравнивать каждое значение в Листе

  print(mapOfPeople);
  print(listOfPeople);
//   Массив нужен, чтобы хранить список чего-то и применять операции, а map нужен, чтобы быстро находить, достать, удалить и т.п. значения по ключу
  mapOfPeople['0102 344555'] = 'aedwqe'; //добавить значение
  mapOfPeople['0102 344555'] = 'aedwqвыыe'; //изменить значение
  mapOfPeople.remove('0102 344555');

  // не падает, когда нет значения, возвращает null
  print(mapOfPeople['0102 344555']);
  final Set<String> setOfPeople = {
    'Ivanov V',
    'Faina U',
//     'Ydashkin R',
//     'Varlamov F',
  };

//   Пересечения

  final Set<String> aOfPeople = {
//     'Ivanov V',
    'Faina U',
    'Ydashkin R',
//     'Varlamov F',
  };

//достает одинаковые значения, создает с ними Set
  final resultSet = setOfPeople.intersection(aOfPeople);
  // объединяет списки
  final resultSet2 = setOfPeople.union(aOfPeople);
  //убирает повторяющиеся значения второго из первого, создает с ними Set
  final resultSet3 = setOfPeople.difference(aOfPeople);
  print(resultSet);
  print(resultSet2);
  print(resultSet3);

// Сеты не выводят повторяющиеся значения (подчеркивают совпадающие на этапе написания кода), поддерживают быстрый поиск по contains
// В основном нужен для того, чтобы найти есть ли там уже значение и чтобы в целом были уникальные значения.

// Отличия. List быстро перебирают,тк находятся друг за другом по порядку.
// Map быстрый поиск по ключу.
// Set нужен для хранения уникальных значений и для проверки есть ли там элемент.
}
