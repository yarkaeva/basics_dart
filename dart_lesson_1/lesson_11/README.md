# Generics. Дженерики (обобщения)
Иногда возникает необходимость, определить функционал таким образом, чтобы он *мог использовать данные любых типов*.

*Например*, мы хотим создать функцию `sum` которая будет суммировать две переменных `a` и `b`. 

```dart
void main() {
  final a = sum(3, 2);
  print(a);
}

int sum(int a, int b) {
  return a + b;
}
```
Но если мы захотим положить в `a`значение типа `double`, то получим ошибку. Чтобы решить эту проблему мы можем написать еще одну функцию для работы с типом `double`:

```dart
void main() {
  final a = sum(3, 2);
  print(a);

  final b = sumDouble(3.5, 2);
  print(b);
}

//одинаковый функционал приходится дублировать
int sum(int a, int b) {
  return a + b;
}

double sumDouble(double a, double b) {
  return a + b;
}
```
Соответсвенно мы сталкиваемся с другой проблемой -  дублированием кода.

Generics, или обобщения, позволяют обеспечить большую безопасность типов и помогают избежать дублирования кода.

```dart
void main() {
  final d = sumGeneric(3.5, 2);
  print(d);
}

// шаблонная функция, дженерик функция
T sumGeneric<T extends num>(T a, T b) {
  return a + b as T;
}
```

При выполнении программы вместо Т будет подставляться конкретный тип. Причем тип будет вычислять динамически на основе переданных значений.

Для создания обобщенного метода после его имени указывается в угловых скобках название универсального параметра. После этого внутри этого универсальный тип T может использоваться внутри метода - в качестве типа параметров или переменных.

Т.е. здесь написано, что функция `sumGeneric` будет возвращать значение типа `T` и работать с типом `T`, который наследуется от типа num b и принимает параметр `a` с типом `T`, и параметр `b` с типом `T`.

Необязательно называть универсальный параметр буквой `T`, можно как угодно, но это наиболее распостраненное (T- от Type). 

Также можно использовать несколько универсальных параметров. 
Например:

```dart
void main() {
  final x = some<String, double>('dssd', 3.6);
  print(x);
}

String some<T, Z>(T a, Z b) {
  return "$a, $b";
}
 ```
Так дженерики работают с классами: 

```dart
void main() {
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
```


