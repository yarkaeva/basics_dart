void main() {
  final result = listMaker();
  print(result);
  final result2 = generatorSync().toList();
  print(result2);
  final result3 = generatorAsync();
  result3.listen((event) {
    print(event);
  });
  final result4 = naturalsDownFrom(10);
  print(result4);
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
Iterable<int> generatorSync() sync* {
  yield 5;
  yield 7;
  for (var i = 0; i < 10; i++) {
    yield i;
  }
}

// Асинхронный генератор
Stream<int> generatorAsync() async* {
  yield 5;
  yield 7;
  for (var i = 0; i < 10; i++) {
    yield i;
  }
}

//Если генератор возвращает генератор, то к yield нужно дописывать звездочку.
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}
