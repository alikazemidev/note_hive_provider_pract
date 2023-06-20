import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          // An action can be bigger than the others.
                          onPressed: (context) {},
                          backgroundColor: Color.fromARGB(255, 49, 7, 186),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'edit'.toUpperCase(),
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Color.fromARGB(255, 255, 0, 0),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'delete'.toUpperCase(),
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            fillColor: MaterialStatePropertyAll(Colors.green),
                            checkColor: Colors.white,
                            shape: CircleBorder(side: BorderSide()),
                            onChanged: (value) {},
                            value: true,
                          ),
                        ),
                        title: Text(
                          'item $index',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        subtitle: Text('subtitle $index'),
                        trailing: Text(
                          '${DateTime.now().hour}:${DateTime.now().minute}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _taskController,
                decoration: InputDecoration(
                  hintText: 'your task is...',
                  border: InputBorder.none,
                  fillColor: Colors.grey.shade600,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        print(_taskController.text);
                      },
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
