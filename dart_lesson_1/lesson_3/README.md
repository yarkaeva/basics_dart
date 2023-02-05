# Коллекции. 
Стандартно, как и во многих языках - 3

## list
Список - это массив, в котором элементы идут один за другим и имеют длину. В <> скобках указывается тип.
Чтобы положить значения в список, можно записать их в [] скобки, можно положить переменные, выражения
Можно обращаться к элементам списка по индексу или через свойства first/last.
Индекс представляет номер элемента в массиве, при этом нумерация начинается с нуля, поэтому индекс первого элемента будет равен 0.

```dart
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
```


### Свойства List
Если *список пустой*, то программа крашнется, поэтому нужно делать проверку с помощью свойства`.isEmpty/.isNotEmpty`

*Например*,
```dart
if (listOfInt.isNotEmpty) {
    print(listOfInt.first);
    print(listOfInt.last);
  } else {
    print('список пуст');
  }
```

Если указать *индекс*, которого нет в массиве - краш. Исправить можно проверкой на длину:
```dart
if (listOfInt.length >= 8) {
    print(listOfInt[0]);
    print(listOfInt[7]);
  } else {
    print('список пуст');
  }
```

`istOfInt.first`: возвращает первый элемент
`listOfInt.last`: возвращает последний элемент
`listOfInt.length`: возвращает длину списка
`listOfInt.reversed`возвращает список, в котором все элементы расположены в противоположном порядке (не переворачивает оригинальный).
Для того, чтобы получить перевернутый список можно
```dart
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

  List<int> a = [];
  a.addAll(listOfInt.reversed);
```
или
```dart
 final b = listOfInt.reversed.toList();
```
или
```dart
listOfInt = listOfInt.reversed.toList(); //в этом варианте listOfInt не должна быть final
```

### Некоторые методы List
**add(E value)**
- `listOfInt2.add(7);` добавляем в конец 1 значение
**addAll(Iterable<E> iterable)** 
- listOfInt2.addAll([3, 4]);  добавляет в конец списка другой список(несколько значений)

**indexOf(E element)**: 
- возвращает первый индекс элемента
```dart
final newList3 = list.indexOf(6);// (6)вытаскивает индекс значения 6, если 6 повторяется, то вытащит индекс первого
```
**indexWhere(bool test(E element), [ int start = 0 ]) → int**
- возвращает первый элемент, подходящий условию
```dart
final newList7 = list.indexWhere(
      (element) => element - 3 == 2); 
```

**contains(Object element)**
- возвращает true, если элемент содержится в списке

**cast<R>() → List<R>**
делает списком
```dart
final a = 4;

List<Object> castExample = [a];
  final newList = castExample.cast<int>(); // меняет тип на int
  final f = newList.first + 3;
  print(f);
```

**fillRange(int start, int end, [ E fillValue ])** 
заменяет значения в массиве  в промежутке. Включает первое, исключает второе, меняет на третье
```dart
 List<int> list = [1, 10, 2, 6, 5]; 
  list.fillRange(1, 3, 10); //.fillRange заменяет значения в массиве (изменяет его) в промежутке от 1 до 3 (1 включительно, 3 невключительно), 10 -  на что заменить
```

**getRange(int start, int end) → Iterable<E>**
.getRange вытаскивает значения из массива в промежутке от первого значени до второго (1 включительно, 2 невключительно)

```dart
List<int> list = [1, 10, 2, 6, 5];
  final newList = list.getRange(1, 3);
  print(list);
  print(newList);
  //выведет [1, 10, 2, 6, 5] 
  //(10, 2)
```




**insert(int index, E element)**
- вставляет элемент на определенную позицию


**remove(Object value)** 
- удаляет объект из списка (удаляется только первое вхождение элемена в список)
`list.remove(5);` // удаляет значение 5

**removeAt(int index)**
- удаляет элементы по индексу

**forEach(void f(E element))**
- производит над элементами списка некоторое действие, которое задается функцией-параметром, аналоги цикла for..in

**insert(int index, E element)**
- вставляет элемент на определенную позицию

```dart
list.insert(0,9); //в нулевой индкес вставляем значение 9,изменяем массив. Если указатиь несуществующий индекс - краш
```
**join([String separator = "" ]) → String**
конвертирует каждый элемент в строку и складывает их 
```dart
final listOfInt5 = const [2, 4, 2, 6, 2];
final result = listOfInt5.join(','); 
final result2 = listOfInt5.join('');
print(result);//выведет 2,4,2,6,2
print(result2);//выведет 24262
  ```
**map<T>(T f(E e)) → Iterable<T>**
Returns a new lazy Iterable with elements that are created by calling f on each element of this Iterable in iteration order.
// создает новый список, пройдется по всему массиву и добавит к каждому элементу 5
// без .toList() тип ddd - MappedListIterable<int, int>
  final ddd = listOfInt5.map((e) => e + 5).toList();
  print(ddd);


```dart
```