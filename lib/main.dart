import 'package:flutter/material.dart';
import 'package:flutter_tutorial/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int get value => items.where((element) => element.isSelected == true).length;

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isSelected) {
          setState(() {
            isSelected = false;
          });
          return false;
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: !isSelected
              ? const Text('Hello, Good Morning')
              : Text('selected $value'),
          actions: [
            isSelected
                ? IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                : Container()
          ],
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return InkWell(
              onLongPress: () {
                setState(() {
                  items[i].isSelected = !items[i].isSelected!;
                  if (items[i].isSelected!) {
                    isSelected = true;
                  } else if (!items[i].isSelected! && value == 0) {
                    isSelected = false;
                  }
                });
              },
              onTap: () {
                setState(() {
                  items[i].isSelected = !items[i].isSelected!;
                  if (items[i].isSelected!) {
                    isSelected = true;
                  } else if (!items[i].isSelected! && value == 0) {
                    isSelected = false;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 65,
                  color: items[i].isSelected! ? Colors.yellow : Colors.red,
                  child: Center(child: Text('${items[i].name} Index $i')),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Items> items = [
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
  Items(name: 'Books'),
];

class Items {
  String? name;
  bool? isSelected;
  Items({
    this.name,
    this.isSelected = false,
  });
}
