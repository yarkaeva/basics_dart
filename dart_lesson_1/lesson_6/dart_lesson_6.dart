import 'dart:math';

void main(List<String> args) {
  // final shape = Shape(Color.Blue);
  final triangle = Triangle(Color.Green, 10, 3, 90);
  final circle = Circle(Color.Red, 6);
  final square = Square(Color.Green, 9);

  // print(shape);
  print(triangle);
  print(circle);
  print(square);

  final list = [triangle, circle, square];
  list.first.color;

  print(Color.Red);
  print(Color.Red.index);
}

// перечисления, их можно сравнивать
enum Color {
  Red,
  Green,
  Blue,
}

// родитель
abstract class Shape {
  Shape(this.color);

  double get square => 0.0;
  final Color color;

  @override
  String toString() {
    return '$square $color';
  }
}

//наследник, переопределили геттер
class Triangle extends Shape {
  Triangle(
    Color color,
    this.sideA,
    this.sideB,
    this.sideC,
  ) : super(color);

  final int sideA;
  final int sideB;
  final int sideC;

  @override
  double get square => (sideA * sideB * sideC).toDouble();

  @override
  String toString() {
    // мы хотим взять реализацию от родителя и дополнить её
    //
    return super.toString() + '$sideA $sideB $sideC';
  }
}

//наследник, переопределили геттер
class Circle extends Shape {
  Circle(
    Color color,
    this.radius,
  ) : super(color);

  final int radius;

  @override
  double get square => pi * radius;
}

//наследник, переопределили геттер
class Square extends Shape {
  Square(
    Color color,
    this.side,
  ) : super(color);

  int side;

  @override
  double get square => (side * side).toDouble();
//  можем добавить в наследника другой метод
  int sideA() {
    return side;
  }

  int sideB() {
    return side;
  }
}
