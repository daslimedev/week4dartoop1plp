import 'dart:io';

// Define class
class Person {
  String name;
  int age;
  String nationality;

  // Constructor
  Person(this.name, this.age, this.nationality);

  // Method to display
  void displayInfo() {
    print("Name: $name, Age: $age, Nationality: $nationality");
  }
}

// Function to read data from file and create instances of Person
List<Person> readFromFile(String filename) {
  var people = <Person>[];

  // Read data from file and create Person instances
  var file = File(filename);
  var lines = file.readAsLinesSync();
  for (var line in lines) {
    var parts = line.split(',');
    var name = parts[0];
    var age = int.parse(parts[1]);
    var nationality = parts[2];
    var person = Person(name, age, nationality);
    people.add(person);
  }

  return people;
}

void displayPeople(List<Person> people) {
  // Display information for each person using a loop
  for (var person in people) {
    person.displayInfo();
  }
}

void main() {
  // Read data from file and create instances of Person
  var people = readFromFile('people.txt');

  // Display information for each person
  displayPeople(people);
}
