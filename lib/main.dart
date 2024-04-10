import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
   Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(titleConfig: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.titleConfig});

  final String titleConfig;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // postList를 set으로 선언하지 말고, array로 지정하기
  final postList = [
    {
      "title": "Sample Title 1",
      "color": Colors.green,
    },
    {
      "title": "Sample Title 2",
      "color": Colors.grey,
    },
    {
      "title": "Sample Title 3",
      "color": Colors.deepOrange,
    },
    {
      "title": "Sample Title 4",
      "color": Colors.deepOrange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.titleConfig),
      ),
      body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (BuildContext con, int index) {
            return postContainer(
              title: postList[index]["title"] as String,
              colorData: postList[index]["color"] as Color,
            );
          },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget postContainer({String title = '', Color colorData = Colors.blue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
            )
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: colorData,
        )
      ],
    );
  }
}
