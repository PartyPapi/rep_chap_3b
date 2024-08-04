import 'package:flutter/material.dart';

//Die Main startet runApp mit der Klasse "myApp" (siehe unten).
void main() {
  runApp(MyApp());
}

//erstellt User (Klasse)
class User {
  String firstName;
  String lastName;
  int userAge;
  String email;

// Kontruktor mit Angabe der Variablen
  User(this.firstName, this.lastName, this.userAge, this.email);
}

//Listet die User als Liste auf und nutzt dafür den Datentyp "Klasse (User)"
//Die Liste heißt userDatabase
List<User> userDatabase = [];

//dieser Teil registriert einen neuen Nutzer. Dazu nutzt er die neue Klasse
//"newUser" und fügt (".add")diesen newUser zur userDatabase hintenan.
void registerUser(
    String firstName, String lastName, int userAge, String email) {
  User newUser = User(firstName, lastName, userAge, email);
  userDatabase.add(newUser);
}

//dieser Teil gibt aus die volljährigen User aus. Dafür wird für jedes Element
//"user" in der userDatabae in der for-if-Schleife geprüft, ob der Teil ALTER
//größergleich 18 ist. Falls ja, dann wird dieser Datensatz ausgegeben.
void printUsersOfAge() {
  print("Volljährige Nutzer:");
  for (var user in userDatabase) {
    if (user.userAge >= 18) {
      print(
          "Name: ${user.firstName} ${user.lastName}, Alter: ${user.userAge}, E-Mail: ${user.email}");
    }
  }
}

//Durch die Klasse MyApp wird das Statelesswidget ergänzt. Stateless, weil die
//Oberfläche keinerm äußeren Einfluss unterliegt und so keinem State folgen
//muss.
// Der TestEditingController liest die Schaltflächen für die neuen Variablen, die
//auch gleich unveränderbar als FINAL geschrieben sind.
class MyApp extends StatelessWidget {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

//Das Widget build (BuildContext) dient als Basis zum Gestalten des Screens.
//Hier wird in Flutter gerendert, was das widget zurück gibt.
//Es wird eine Instanz von MaterialApp zurück gegeben.
//Der Teil AppBar konstuiert dabei dei Appbar mit dem Namen der Seite.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nutzerregistrierung'),
        ),
        //der Body ist "die Füllung der Seite".
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          //Das eine Kind Column (untereinander) ordnet in der gegensätzlichen Ordinate
          // (horizontal) in der Mitte an.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //Danach kommen die Kinder untereinander vor.
            children: <Widget>[
              //Das TextField baut das Eingabefeld mit einer Beschreibung (Label) auf.
              //Der Controller bekommt den Wert in dem Feld, der dann nach oben gegeben
              //wird, um in die Variable geschrieben zu werden.
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(labelText: 'Vorname'),
              ),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(labelText: 'Nachname'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Alter'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'E-Mail'),
              ),
              //der "erhabene" Taster, der beim Drücken den Teil "registerUser" ausführt.
              //Dazu sammelt er die gerade durchgeführten Eingaben und gibt sie nach oben,
              //wo Der Teil ausgeführt und er User der Liste hizugehfügt wird.
              //Der "parse" Befehl wandelt dabei den String aus der Eingabe in einen
              //Integer um, daher die Kombination "int.parse(Variable)".
              ElevatedButton(
                onPressed: () {
                  registerUser(
                    firstNameController.text,
                    lastNameController.text,
                    int.parse(ageController.text),
                    emailController.text,
                  );
                  //Hier wird nur die Ausführung des Hinzufügens auf der Anzeige quittiert.
                  print("Nutzer erfolgreich registriert.");
                },
                //Das steht etwas unglücklich fast am Ende. Hier wird der Text der Taste
                //geschrieben, die der Nutzerregistrierung auslöst.
                child: Text('Jetzt Registrieren'),
              ),
              //Dieser Taster löst das Anzeigen der volljährigen Nutzer aus, indem er
              //den Teil des Programms aufruft und ausgeben lässt. Das untere Kind ist
              //lediglich der Text der Schaltfläche.
              ElevatedButton(
                onPressed: () {
                  printUsersOfAge();
                },
                child: Text('Volljährige Nutzer anzeigen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
