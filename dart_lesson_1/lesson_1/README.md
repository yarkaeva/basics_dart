# Типы данных

bool - логический тип
int, double - числовые типы
String, Runes - строковые типы
Symbol 

**bool**
этот представляет два значения true/false
``` dart
bool x = 8;
var y = -5;
```
Методы: toString(), noSuchMethod().

**int**
целые числа, которые занимают в памяти не более 64 бит.
```dart
int b = 54;
```

**double**
тип double представляет числа с плавающей точкой, которые занимают в памяти 64 бита.

```dart
double c = 5.4;
```
Переменной типа double также можно присвоить целочисленное значение, в этом случае оно автоматически преобразуется в дробное:

```dart
double y = 5; // 5.0
```
Некоторые методы: compareTo(),round() 

**String**
Строка, последовательность символов в кодировке UTF-16. Использовать одинарные кавычки.

```dart
String s = 'Привет';
```
Есть различные методы, например:
split(), contains(), startsWith(), endsWith(), toString(), toLowerCase(), toUpperCase(), replaceFirst(),replaceAll(), substring(int start, [int? end]) и др.

Конкатенация строк:
```dart
// 1 способ, не рекомендуется
  var ml = 'qwe' + 'asd' + 'zxc';
  print(ml);
// 2 способ
  var i = 'asdafe';
  var iu = 'sdffds';
  var mi = 'fgsfdfsdf';
  var k = '$i $iu $mi';

  print(k);
// 3 способ
  var list = ['asd', 'asdda', 'asdadsad', 'adsada'];
  var kontan = StringBuffer();
  list.forEach((item) {
    kontan.write(item);
  });
  var fff = kontan.toString();
  print(fff);
  ```

Интерполяция:

Пример 1
```dart
String name = 'Дарина';
print('Привет, $name!');
```
Пример 2
```dart
String someString = 'dsasdsadds';
print('Длина строки равна ${someString.length}');
```

**Runes**
также представляет строки, но в отличие от String, это последовательность символов в кодировке Unicode.

## Переменные и константы
Переменная определяется так:

Тип_данных имя_переменной;

Имя переменной не должно совпадать с ключевым словом.

Для определения переменной также можно использовать ключевое слово `var`. В этом случае Dart сам выводит тип переменной, исходя из присвоенного ей значения.
Также можно использовать оператор `dynamic`, который по аналогии сам выведет тип переменной. Его отличие от `var`, в том, что он позволяет изменить тип переменной:

```dart
var name = 'David';
print(name);
name = 16; // ошибка, A value of type 'int' can't be assigned to a variable of type 'String'.
```

```dart
dynamic name = 'David';
print(name);
name = 16;
print(name);
```
**Консольный вывод**: 
David
16

## const final
Если значение переменной менять не нужно, то её можно сделать константой.

final может быть инициализирована лишь раз, const инициализируется во время компиляции.

Можно прописывать или не прописывать тип.

```dart
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
```

(Инициализация - присвоение начального значения).

