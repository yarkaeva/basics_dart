void main() {
  final a = sumDouble(3.5, 2.6);
  print(a);

  final d = sumGeneric(3.5, 2);
  print(d);

  final stack = Stack<int>();

  print(stack);
  stack.push(67);
  print(stack);
  stack.push(1);
  print(stack);
  stack.push(-89);
  print(stack);
  stack.push(15);
  print(stack);

  final f = stack.pop();
  print('$f: $stack');
  final g = stack.pop();
  print('$g: $stack');
  final c = stack.pop();
  print('$c: $stack');
  final n = stack.pop();
  print('$n: $stack');

  final x = some<String, double>('dssd', 3.6);
  print(x);
}

//одинаковый функционал приходится дублировать
int sum(int a, int b) {
  return a + b;
}

double sumDouble(double a, double b) {
  return a + b;
}

// шаблонная функция, дженерик функция
T sumGeneric<T extends num>(T a, T b) {
  return a + b as T;
}

class Stack<Element> {
  List<Element> storage = [];

  void push(Element a) => storage.add(a);

  Element pop() => storage.removeLast();

  @override
  String toString() {
    return storage.toString();
  }
}

String some<T, Z>(T a, Z b) {
  return "$a, $b";
}
