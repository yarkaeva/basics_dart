void main() {
  final car = Car(100);
  car.currentSpeed = 90;
  car.printCurrentSpeed();
  Car.printTotalCarCount();
}

class Car {
  Car(this.lenght);

  final double lenght;
  //статическая константа, создается на жтапе компиляции
  static const double width = 10;
  int currentSpeed = 0;
  // свойство, который отсутсвует у всех объектов(нельзя вызвать через .), но есть у класса
  static int totalCarCount = 0;

  double square() {
    return lenght * width;
  }

  void printCurrentSpeed() {
    print(currentSpeed);
  }

// метод, который отсутсвует у всех объектов(нельзя вызвать через .), но есть у класса
  static void printTotalCarCount() {
    print('123');
  }
}

class Settings {
  static const settingsMinPasswordLenght = 6;
  static const settingsServerUrl = 'https://www.google.ru/';
}
