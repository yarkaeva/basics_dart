# Обработка исключений (try/catch)

В процессе работы программы могут возникать различные ошибки, которые нарушают привычный ход программы и даже заставляют ее прервать выполнение. Такие ошибки называются **исключениями**.

Рассмотрим пример: 

``` dart 
void main() {
  final a = division('5', 'ноль');
  print(a);
}

double division(String a, String b) => int.parse(a) / int.parse(b);
```
Строку b не удается преобразовать в int, поэтому мы получим ошибку.
В итоге программа сгенерирует исключение и завершит свое выполнение.
Мы можем получать данные из внешнего источника и точно не знать, какое там значение. Что делать в таких ситуациях?

## try...on...catch...finally
Для обработки исключений в Dart сущетсвует конструкция `try...on...catch...finally:`

``` dart
try{
    // Код, который может привести к генерации исключения  
}
on Тип_Исключения{
     // Обработка возникшего исключения
}
catch (e){
     // Обработка возникшего исключения
}
finally{
     // 
}
```
При использовании блока `try..on..catch..finally` вначале выполняются все инструкции в блоке `try`. Если в этом блоке не возникло исключений, то после его выполнения начинает выполняться блок `finally`. И затем конструкция `try..on..catch..finally` завершает свою работу.

Разница между операторами `on` и `catch` состоит в том, что `on` обрабатывает исключение определенного типа. А `catch` обрабатывает все исключения.

Если нужный блок `on` или блок `catch` не найден, то при возникновении исключения опять же выполняется блок `finally`, а затем программа аварийно завершает свое выполнение.

Для примера выше мы можем обработать ошибку так:
```dart
void main() {
  try {
    print('Я выполнюсь, т.к. не имею ошибок и до меня не было ошибок');
    final a = division('5', 'выв');
    print(
        'Если выше ошибка, то я и строки кода ниже (в блоке try) не выполнимся. Если ты меня видишь, то ошибки нет');
    final b = a + 6;
    print(b);
  } catch (error) {
    print('Произошла ошибка: $error');
  } finally {
    //блок кода, который выполняется всегда, даже если выше есть ошибки
    print('Выполнение блока finally');
  }
  print("Завершение программы");
}

double division(String a, String b) => int.parse(a) / int.parse(b);

```
**Консольный вывод:**
'Я выполнюсь, т.к. не имею ошибок и до меня не было ошибок
Произошла ошибка: FormatException: выв
Выполнение блока finally
Завершение программы'

Здесь мы видим, что несмотря на генерацию исключение, программа **не завершилась** аварийно, а продолжила свою работу.

При определении конструкции мы можем опускать ряд блоков, если они не нужны. Только блок `try` является *обязательным*. Однако вместе с ним должен также использоваться, как минимум, либо блок `on` и(или) `catch`, либо блок `finally`.

Если опустим блок catch, то:

```dart 
void main() {
  try {
    print('Я выполнюсь, т.к. не имею ошибок и до меня не было ошибок');
    final a = division('5', 'выв');
    print(
        'Если выше ошибка, то я и строки кода ниже (в блоке try) не выполнимся. Если ты меня видишь, то ошибки нет');
    final b = a + 6;
    print(b);
  } finally {
    //блок кода, который выполняется всегда, даже если выше есть ошибки
    print('Выполнение блока finally');
  }
  print("Завершение программы");
}

double division(String a, String b) => int.parse(a) / int.parse(b);

```
**Консольный вывод:**
'Я выполнюсь, т.к. не имею ошибок и до меня не было ошибок
Выполнение блока finally
Uncaught Error: FormatException: выв'

После генерации исключения в блоке `try` выполняется блок `finally`, после чего программа аварийно останавливает свою работу.

## Классы исключений

Ключевой класс для обработки исключений в Dart - это класс `Exception`, который является базовым классом для всех остальных типов исключений. По умолчанию стандартная библиотека предоставляет [ряд встроенных типов исключений](https://api.dart.dev/stable/2.19.2/dart-core/Exception-class.html). 

## Оператор throw и создание своих типов исключений

Однако, мы можем писать собственные типы исключений. 
В конструкции `try..catch` мы можем обрабатывать исключения определенного типа. Для этого применяется оператор `on`. 
Оператор `throw` позволяет нам самим сгенерировать исключение в необходимом месте.

```dart 
void main() {
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
    print('Выполнение блока finally');
  }
}

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

double division(String a, String b) {
  final aa = int.tryParse(a);
  final bb = int.tryParse(b);


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
```
Для каждого типа исключения, который мы хотим обработать, мы можем добавить свой блок `on`. 
Так в примере у нас есть три класса: `IncorrectIntString`, который выводит сообщение о невозможности преобразовать строку в число, `DivisionByZero` - ошибку деления на ноль, `NegativeDouble` - ошибку использования отрицательного числа:

```dart 
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
```