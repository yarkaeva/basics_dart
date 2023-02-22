void main() {
  print('start');
  exampleFutureApi();
  exampleAsync();
  print('end');
}

// ассинхронная функция
Future<int> sum(int a, int b) {
  return Future.sync(() => a + b);
}

exampleFutureApi() {
  final a = sum(1, 4);
  // код ниже это не работает, тк функция асинхронная и еще нет результата
  // final b = sum(a, 9);
  // print(b);
  // final c = sum(b, 9);
  // print(c);

  // можно было бы решить вот так
  a.then((a) {
    print(a);
    final b = sum(a, 9);
    b.then((b) {
      print(b);
      final c = sum(b, a);
      c.then((c) => print(c));
    });
  });
}

// ИЛИ можно решить вот так, перепишем тот же код с использованием async-await
Future<void> exampleAsync() async {
  final a = await sum(1, 4);
  final b = await sum(a, 9);
  print(b);
  final c = await sum(b, a);
  print(c);
}
