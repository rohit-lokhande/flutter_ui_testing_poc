import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Testing Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter UI Testing Demo'),
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
  TextEditingController _controller = TextEditingController();
  final List<String> _list = [];
  var emptyString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        child: Column(
          children: [
            TextField(
              key: ValueKey("write_data"),
              controller: _controller,
            ),
            FlatButton(
              key: ValueKey("add_data"),
              color: Colors.cyan,
              child: Text(
                "Add",
              ),
              onPressed: () {
                setState(() {
                  _list.add(_controller.text);
                  _controller.text = emptyString;
                });
              },
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    _list[index],
                  );
                },
                itemCount: _list.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
