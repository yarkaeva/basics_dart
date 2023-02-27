# Generators
## Синхронный генератор
Обязательно функция, создается с помощью ключевого слова со звездочкой `sync*`.

Внутри него можно использовать `yield`, аналог `return`, который возвращает значение, но при этом не прерывает дейтсвие функции.

Всё, что функция вернет, будет собрано и помещено в `Iterable`, который в свою очередь можно преобразровать в list, map, set.

Например, 

```dart
void main() {
  final result = listMaker();
  final result2 = generator().toList();
  print(result);
  print(result2);
}

Iterable<int> listMaker() {
  var list = <int>[];
  list.add(5);
  list.add(7);
  for (var i = 0; i < 10; i++) {
    list.add(i);
  }
  return list;
}

// Синхронный генератор
Iterable<int> generator() sync* {
  yield 5;
  yield 7;
  for (var i = 0; i < 10; i++) {
    yield i;
  }
}

```
Получаем одинаковый **консольный вывод:**
[5, 7, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


## Асинхронный генератор 

Обязательно функция, создается с помощью ключевого слова со звездочкой `async*`. 
Вовзращает `Stream`

```dart
void main() {
  final result3 = generatorAsync();
  result3.listen((event) {
    print(event);
  });
}

// Асинхронный генератор
Stream<int> generatorAsync() async* {
  yield 5;
  yield 7;
  for (var i = 0; i < 10; i++) {
    yield i;
  }
}

```

Если генератор возвращает генератор, то к yield нужно дописывать звездочку.

```dart
void main() {
  final result4 = naturalsDownFrom(10);
  print(result4);
}


Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}
