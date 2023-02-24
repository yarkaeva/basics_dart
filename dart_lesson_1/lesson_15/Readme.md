# Асинхронность часть третья (Stream)
Асинхронное программирование в Dart характеризуется классами Future и Stream.

`Future` представляет собой вычисление, которое не завершается немедленно. Там, где обычная функция возвращает результат, асинхронная функция возвращает `Future`, который в конечном итоге будет содержать результат. 

`Stream` (Поток) предоставляет способ получения последовательности событий. Вы создаете поток, вызывая асинхронную функцию, которая затем возвращает поток. Использование этого потока приведет к тому, что функция будет генерировать события до тех пор, пока не закончится, и поток не закроется.


## Stream и StreamSubscription

Для того, чтобы использовать поток, необходимо создать его и подписаться: 

**!** Без подписки нельзя получить данные из потока.
```dart
Stream<int>? stream;
StreamSubscription<int>? subscription;

void main() {
  exampleStreamSubscription();
}

void exampleStreamSubscription() {
  stream = Stream.periodic(Duration(seconds: 1), (tick) => tick);
  subscription = stream?.listen((event) {
    //слушать поток
    print(event);
  });
  Future.delayed(Duration(seconds: 15), () {
    subscription?.cancel(); //прекратить подписку
  });
}
```

Необходимо передать в метод .listen() некию функцию, чтобы как-то манипулировать с пришедшими данными. Функция должна принимать параметр типа, указанного при создании.

Вызов метода .cancel() завершает подписку, освобождая ресурсы, и предупреждая вызов вашей прослушивающей функции после того, как это стало ненужным.



**Важно:** большинство Dart-потоков позволяют только *разовую подписку*, то есть на них *нельзя подписываться повторно* после завершения подписки — это вызовет *исключение*.


```dart
Stream<int>? stream;

StreamSubscription<int>? subscription1;
StreamSubscription<int>? subscription2;

void main() {
  exampleBroadcast();
}


void exampleBroadcast() {
  print('one');
  stream =
      Stream.periodic(Duration(seconds: 1), (tick) => tick);
  print('two');
  subscriptionOne = stream?.listen((event) {
    //слушать стрим
    print('SubscriptionOne: $event');
  });

  subscriptionTwo = stream?.listen((event) {
    //слушать стрим
    print('SubscriptionTwo: $event');
  });
  Future.delayed(Duration(seconds: 10), () {
    subscriptionOne?.cancel(); //прекратить подписку
    subscriptionTwo?.cancel();
  });
}
}

```

Выведет исключение: Bad state: Stream has already been listened to.

Если есть такая необходимость, то можно использловать метод `.asBroadcastStream()` и подписываться на стрим из разных мест.

```dart
stream = Stream.periodic(Duration(seconds: 1), (tick) => tick).asBroadcastStream();
```

В следующем примере не срабатывает второй await. 

```dart 
void exampleBroadcastAwait() async {
  print('one');
  stream = Stream.periodic(Duration(seconds: 1), (tick) => tick).asBroadcastStream();
  print('two');
  await for (var item in stream!) {
    print(item);
  }
  print('three');
  await for (var item in stream!) {
    print(item);
  }
}
```
Т.к. `exampleBroadcastAwait()`асинхронная функция, то пока стрим не завершится, `await` не даст идти дальше по коду, поэтому строки 

```dart
print('three');
  await for (var item in stream!) {
    print(item);
  }
``` 
не будут исполнены.

Если мы перепишем этот пример вот так:


```dart
void exampleBroadcastAwait() {
  print('one');
  stream =
      Stream.periodic(Duration(seconds: 1), (tick) => tick).asBroadcastStream();
  print('two');
  listenOne();
  print('three');
  listenTwo();
}

Future<void> listenOne() async {
  await for (var item in stream!) {
    print(item);
  }
}

Future<void> listenTwo() async {
  await for (var item in stream!) {
    print(item);
  }
}
```

exampleBroadcastAwait() больше не асинхронна, поэтому в консоли получим вывод:

```
one
two
three
0
0
1
1
2
2
...
```


## StreamController
Для того, чтобы контролировать стрим, нужно использовать `StreamController<T> `

.add позволяет добавить значение в стрим.
.close закрывает контроллер и соответственно стрим.


```dart
StreamController<int> controllerTwo = StreamController<int>;

...

void exampleStreamController() {
  print('one');
  controller.add(1);
  controller.add(2);
  controller.add(3);
  controller.add(4);
  controller.add(5);
  print('two');

  subscriptionOne = controller.stream.listen((event) {
    print(event);
  });

  print('three');
  controller.add(6);
  controller.add(7);
  controller.add(8);
  controller.add(9);
  controller.add(10);
  Future.delayed(Duration(seconds: 3), () {
    controller.add(
        11); //11 не выведется, контролер ассинхронный, поэтому подписка закроется раньше, чем добавится значение
    subscriptionOne?.cancel();
    controller.close(); //закрыть контроллер, закрыть стрим
    // controller.add(12); выдаст ошибку, нельзя добавить событие после того, как контроллер закрыт
  });
}
```
Особенность стримов - если что-то закинуто в стрим до подписки, оно никуда не теряется. В .listen значения попадают в том порядке, в котором их отправили.

Можно сделать контроллер синхрооным, с помощью параметра `sync: true`. НО здесь важен порядок подписки, подписаться нужно до добавления значений.

```dart
StreamController<int> controllerTwo = StreamController<int>(sync: true);
```

```dart
void exampleStreamControllerSync() {
  subscriptionOne = controllerTwo.stream.listen((event) {
    print('subscriptionOne: $event');
  });
  print('one');
  controllerTwo.add(1);
  controllerTwo.add(2);
  controllerTwo.add(3);
  controllerTwo.add(4);
  controllerTwo.add(5);
  print('two');
  print('three');
  controllerTwo.add(6);
  controllerTwo.add(7);
  controllerTwo.add(8);
  controllerTwo.add(9);
  controllerTwo.add(10);
  Future.delayed(Duration(seconds: 3), () {
    subscriptionOne?.cancel();
    subscriptionTwo?.cancel();
    controllerTwo.close();
  });
  ```
  **Консольный вывод:**

one
subscriptionOne: 1
subscriptionOne: 2
subscriptionOne: 3
subscriptionOne: 4
subscriptionOne: 5
two
three
subscriptionOne: 6
subscriptionOne: 7
subscriptionOne: 8
subscriptionOne: 9
subscriptionOne: 10