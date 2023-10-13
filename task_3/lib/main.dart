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
                          leading:
                              Image.network('https://picsum.photos/200/300'),
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
                          leading:
                              Image.network('https://picsum.photos/200/300'),
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
    builder: (context) => const SizedBox(
      height: 150,
      child: ModalWidget(),
    ),
  );
}

class ModalWidget extends StatefulWidget {
  const ModalWidget({super.key});

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // controller.dispose();
    debugPrint('Disposed Modal Widget');
    super.dispose();
  }

  List<MemoryLeakObject> leakObjects = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            controller: controller,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                while (leakObjects.length < 1000000) {
                  leakObjects.add(
                    MemoryLeakObject('Count: ${leakObjects.length}'),
                  );
                }
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
      ],
    );
  }
}

class MemoryLeakObject {
  final String text;

  MemoryLeakObject(this.text);
}
