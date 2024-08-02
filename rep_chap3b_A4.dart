class User {
  String firstName;
  String lastName;
  int userAge;
  String email;
  User(this.firstName, this.lastName, this.userAge, this.email);
  bool isOfAge() {
    return userAge >= 18;
  }
}

List<User> userDatabase = [];
void registerUser(
    String firstName, String lastName, int userAge, String email) {
  User newUser = User(firstName, lastName, userAge, email);
  userDatabase.add(newUser);
  print("Nutzer ${newUser.firstName} ${newUser.lastName} is registrated.");
}

void printUsersOfAge() {
  print("adult user:");
  for (User user in userDatabase) {
    if (user.isOfAge()) {
      print(
          "${user.firstName} ${user.lastName}, Alter: ${user.userAge}, Email: ${user.email}");
    }
  }
}

void main() {
  registerUser("Max", "Mustermann", 30, "max.mustermann@example.com");
  registerUser("Alfred E.", "Neumann", 27, "erika.mustermann@example.com");
  registerUser("Clark", "Kent", 38, "john.doe@example.com");
  registerUser("Bruce", "Wayne", 43, "jane.doe@example.com");
  registerUser("Nadine", "Erdbeerkäse", 26, "alice.wonderland@example.com");

  printUsersOfAge();
}
