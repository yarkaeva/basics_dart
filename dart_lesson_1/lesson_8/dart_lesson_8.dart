void main() {
  Duck().fly();
  Duck().say();
  Airplane().fly();
  Airplane().repair();
  Worker().work();
  Duck().work();
}

mixin Beast {
  void say() {
    print('it`s say');
  }
}

mixin Mehanism {
  void repair() {
    print('it`s repair');
  }
}

mixin Flyable {
  void fly() {
    print('it`s fly');
  }
}

class Duck with Flyable, Beast, Worker {}

class Airplane with Flyable, Mehanism {}

class Worker {
  String? company;
  void work() {
    print("Work in $company");
  }
}
