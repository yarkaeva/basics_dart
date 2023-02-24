import 'dart:async';

Stream<int>? stream;

StreamSubscription<int>? subscription;
StreamSubscription<int>? subscriptionOne;
StreamSubscription<int>? subscriptionTwo;

StreamController<int> controller = StreamController<int>();
StreamController<int> controllerTwo = StreamController<int>(sync: true);

void main() {
  // exampleStreamSubscription();
  // exampleStreamAsyncAwait();
  // exampleBroadcast();
  // exampleBroadcastAwait();
  // exampleStreamController();
  exampleStreamControllerSync();
}

void exampleStreamSubscription() {
  print('one');
  stream = Stream.periodic(Duration(seconds: 1), (tick) => tick);
  print('two');
  subscription = stream?.listen((event) {
    //слушать стрим
    print(event);
  });
  Future.delayed(Duration(seconds: 5), () {
    subscription?.pause(); //поставить подписку на паузу
  });
  Future.delayed(Duration(seconds: 10), () {
    subscription?.resume(); //возобновить подписку после паузы
  });
  Future.delayed(Duration(seconds: 15), () {
    subscription?.cancel(); //прекратить подписку
  });
}

void exampleStreamAsyncAwait() async {
  print('one');
  stream = Stream.periodic(Duration(seconds: 1), (tick) => tick);
  print('two');
  await for (var item in stream!) {
    print(item);
  }
  print('three');
  Future.delayed(Duration(seconds: 10), () {
    subscription?.cancel(); //прекратить подписку
  });
}

void exampleBroadcast() {
  print('one');
  stream =
      Stream.periodic(Duration(seconds: 1), (tick) => tick).asBroadcastStream();
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
}
