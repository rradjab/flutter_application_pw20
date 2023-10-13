import 'package:flutter/material.dart';
import 'package:task_1/models/student_model.dart';
import 'package:task_1/services/get_students.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<StudentModel> studentsList = getStudents();
  //final image = Image.network('https://picsum.photos/200/300');
  final image = Image.asset('assets/tree.jpg');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Inspector'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          bottom: const TabBar(
            tabs: [Tab(text: 'Students'), Tab(text: 'Activists')],
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: studentsList
                  .map(
                    (e) => SizedBox(
                      height: 77.7,
                      child: Card(
                        child: ListTile(
                          title: Text('${e.name} (gpa: ${e.gpa})'),
                          subtitle: Text(
                            e.biography,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: image,
                          trailing: Switch(
                            value: e.isActivist,
                            onChanged: ((value) {
                              e.isActivist = value;
                              setState(() {});
                            }),
                          ),
                          onTap: () => showModal(context),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: studentsList
                  .where((e) => e.isActivist == true)
                  .map(
                    (e) => SizedBox(
                      height: 77.7,
                      child: Card(
                        child: ListTile(
                          title: Text(e.name),
                          subtitle: Text(
                            e.biography,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: image,

                          // trailing: Switch(
                          //   value: e.isActivist,
                          //   onChanged: ((value) => e.isActivist = value),
                          // ),
                          onTap: () => showModal(context),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
    );
  }
}

void showModal(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    context: context,
    builder: (context) => SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
            label: const Text('Agree'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            label: const Text('Dismiss'),
          ),
        ],
      ),
    ),
  );
}
