int globalA = 0;
int a = 4;

void main(List<String> args) {
  // print(sum(4, 7));

  globalA = 4; //переопределили переменную
  void sum2() {
    globalA = globalA + 5;
    print(globalA);
  }

  sum2(); //выведет 9

  int a = 0;
  final result = sum4(6);
  print(result); // выведет 10

  print('4 times two is ${timesTwo(4)}');
  print('4 times four is ${timesFour(4)}');
  print('2 x 2 x 2 is ${runTwice(2, timesTwo)}');

  final result2 = runTwice(5, (x) => x - 1);
  print(result2); // выведет 3

  final sumAnonim = (int n, int l) {
    return n + l; //анонимную функцию положили в переменную sumAnonim
  };
  print(sumAnonim(1, 4));
}

int sum(int a, int b) {
  final result = a + b;
  return result;
}

int sum4(int b) => a + b;

// принимает функцию
int timesTwo(int x) {
  return x * 2;
}

int timesFour(int x) => timesTwo(timesTwo(x));

int runTwice(int x, int Function(int) f) {
  for (var i = 0; i < 2; i++) {
    x = f(x);
  }
  return x;
}
