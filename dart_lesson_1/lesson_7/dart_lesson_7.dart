void main() {
  // Так как кладем в список разные объекты они пытаются найти одного общего
  // предка, но тк не наследуются от какого-то общего класса, то этот предок
  // как правило, Object. Тот в свою очередь не имеет свойства weight.
  // Классы имплементируют интерфейс Weightable, поэтому мы можем
  // обобщить их под типом этого интерфейса.

  final listOfSome = <Weightable>[Cup(1, 18), Plate(2, 11), Table(4, 56)];
  double totalWeight = 0;
  for (final element in listOfSome) {
    totalWeight += element.weight;
  }

  print(totalWeight);
}

abstract class Indetinfirable {
  Indetinfirable(this.id);

  final int id;
}

abstract class Dishable {
  void put();
  void fill();
}

abstract class Weightable {
  Weightable(this.weight);

  final double weight;
}

class Cup implements Weightable, Dishable, Indetinfirable {
  Cup(this.id, this.weight);

  final double weight;
  final int id;

  @override
  void put() {
    print('put cup');
  }

  @override
  void fill() {
    print('fill cup');
  }
}

class Plate implements Weightable, Dishable, Indetinfirable {
  Plate(this.id, this.weight);

  final double weight;
  final int id;

  @override
  void put() {
    print('put plate');
  }

  @override
  void fill() {
    print('fill plate');
  }
}

class Table implements Weightable {
  Table(this.id, this.weight);

  final double weight;
  final int id;

  void put() {
    print('put table');
  }
}
