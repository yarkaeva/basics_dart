// аргументы функций

void main() {
//   final result = sum(1,6, 10, 10);
//   print (result);

  final a = makeUser(surname: 'Иванов', name: 'Иван', age: 12);
  final b = makeOldUser('Bdfy', 'dsds', 45);
  print(a);
  User(name: 'Ivan', surname: 'Ivanoe', age: 14);
}

// int sum (
//   int a,
//   int b, [
//   int c = 0 ,
//   int d = 90,
//   ]){
//   return a + b + c + d;
// }

String makeUser(
    {String name = '',
    String surname = '',
    int age = 0,
    String passport = ''}) {
  return "$name $surname $age $passport";
}

String makeUser2(
    {required String name,
    required String surname,
    required int age,
    String passport = ''}) {
  return "$name $surname $age $passport";
}

String makeOldUser(String name, String surname, int age,
    [String passport = '']) {
  return "$name $surname $age $passport";
}

String makeUser3(int a, int b,
    {required String name,
    required String surname,
    required int age,
    String passport = ''}) {
  return "$name $surname $age $passport";
}

class User {
  final String name;
  final String surname;
  final int age;
  final String passport;

  User(
      {required this.name,
      required this.surname,
      required this.age,
      this.passport = ""});
}

// ?? if null
// [] - необязательные аргументы, могут иметь значение по умолчанию
// {} - необязательные именнованные аргументы. значение по дефолту
// {required } - обязательные именнованные аргументы, не могут иметь значения по дефолту
