import 'package:flutter/material.dart';
import 'package:midterm_lab_exam_161077/widgets/TodoItem.dart';
import 'package:provider/provider.dart';
import 'ToDo.dart';
import 'models/ToDoModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDoModel(),
      child: MaterialApp(
        title: 'ToDo List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'ToDo List'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void fetchTodos() async {
    http.Response response = await http.get('https://jsonkeeper.com/b/0B3I');
    List<ToDo> _todos = [];
    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;
      _todos = jsonArray.map((e) => ToDo.fromJson(e)).toList();
      context.read<ToDoModel>().setTodos(_todos);
    }
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => MainPage(),
    //     ));
  }

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Consumer<ToDoModel>(
                builder: (context, value, child) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: value.to_dos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ToDoItem(
                            date: value.to_dos[index].date,
                            description: value.to_dos[index].description,
                            done: true,
                            title: value.to_dos[index].title,
                          );
                        }

                        // return Text('value.to_dos[0].date');
                        // return Text(value.to_dos[0].date);
                        ),
                  );
                },
              ),
            ),
            FlatButton(
                onPressed: null,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('ShowCancelled'),
                )))
          ],
        ),
      ),
    );
  }
}
