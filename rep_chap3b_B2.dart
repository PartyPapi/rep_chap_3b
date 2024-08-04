import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  //build bietet den generellen Aufbau der Seite mit den Rückgaben der MaterialApp.
  Widget build(BuildContext context) {
    return MaterialApp(
      //Der Pfad für root
      initialRoute: '/',
      //die Seite "add" liegt auf diesem Pfad.
      routes: {
        '/': (context) => ChecklistScreen(),
        '/add': (context) => AddItemScreen(),
      },
    );
  }
}

//ChecklistScreen beerbt ein StatefulWidget, da sich sein Status mit den Eingaben ändert.
class ChecklistScreen extends StatefulWidget {
  @override
  //Der Unterschied signalisiert die "private Klasse", die nur innerhalb dieses
  //Programms genutzt werden kann. Daher: CheckListScreenState erweitert den
  //Status (State) von CheckListScreen
  _ChecklistScreenState createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  // Die Liste der CheckListItems wird aufgebaut.
  List<String> checklistItems = [];

//Die Void löscht die Teile, dei bereits eingegeben wurden laut dem Index.
  void removeItem(int index) {
    setState(() {
      //die Prüfmöglichkeit mit der Löschfunktion (nach Index)
      checklistItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Grafisches Grundgerüst Scaffold
    return Scaffold(
      //Appbar mit Name innerhalb des Scaffold
      appBar: AppBar(title: Text('Checklisten-Einträge')),
      //Body ist der eigentliche Körper der Seite und hier eine Liste.
      body: ListView.builder(
        //Prüfmöglichkeit mit Längenausgabe zu itemCount
        itemCount: checklistItems.length,
        itemBuilder: (context, index) {
          //die Bestimmung der Kacheln in der Liste
          return ListTile(
            title: Text(checklistItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              //Beim Drücken wird diese Kachel über die Indexbestimmung gelöscht.
              onPressed: () => removeItem(index),
            ),
          );
        },
      ),
      //hier wird der Nutzer zum Bildschirm zum Hinzufügen eines neuen
      //Listeneintrags ("add") geleitet.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        //beschriebt innerhalb des FAB nur das add-Icon.
        child: Icon(Icons.add),
      ),
    );
  }
}

//die Klasse des Hinzufügens einer Kachel/eines Items beerbt ein StatefulWidget.
class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

//Die private Klasse AddItemScreenState beerbt State.
//Diese nächste Zeile definiert eine neue State-Klasse mit dem Namen _AddItemScreenState,
//die den Zustand für den Bildschirm zum Hinzufügen neuer Einträge (AddItemScreen)
//behandelt.
class _AddItemScreenState extends State<AddItemScreen> {
//TextEditingController steuert bzw. überwacht Textfelder. Hier steuert "newItemController"
//Das Textfeld für den neuen Eintrag.
  TextEditingController newItemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Neuer Eintrag')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              //siehe oben
              controller: newItemController,
              //Möglichkeit des Controllers
              decoration: InputDecoration(labelText: 'Neuer Eintrag'),
            ),
            //SizedBox zum Bestimmern der Grafik (Abstandshalter)
            SizedBox(height: 16.0),
            //Das Tastfeld führt beim Bedienen aus, dass der Text, den "newItem" üder den
            //newItemController bekommt, dort gespeichert und über den Navigator.pop
            // eingefügt wird.
            ElevatedButton(
              onPressed: () {
                String newItem = newItemController.text;
                Navigator.pop(context, newItem);
              },
              //Der Text des EB.
              child: Text('Hinzufügen'),
            ),
          ],
        ),
      ),
    );
  }
}
