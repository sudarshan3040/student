import 'package:flutter/material.dart';
import 'package:my_student/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Flutter with Laravel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Connect Flutter with Laravel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Student studentService = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: FutureBuilder<List>(
            future: studentService.getAllStudent(),
            builder: (context, snapshot) {
              title:
              print(snapshot.data);
              print("sudarshan");
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          snapshot.data![i]['sanme'],
                          style: TextStyle(fontSize: 30.0),
                        ),
                        subtitle: Text(
                          snapshot.data![i]['email'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No Data Found'),
                );
              }
            },
          ),
        ));
  }
}
