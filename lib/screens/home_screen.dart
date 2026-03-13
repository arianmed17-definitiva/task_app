import 'package:flutter/material.dart';
import '../services/task_service.dart';
import '../services/weather_service.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TaskService taskService = TaskService();
  final WeatherService weatherService = WeatherService();

  final taskController = TextEditingController();

  String weather = "";
  double temperature = 0;
  String description = "";

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

void loadWeather() async {

  final response = await weatherService.getWeather("Torreon");

  final Map<String, dynamic> data = Map<String, dynamic>.from(response);

  setState(() {

    temperature = (data["main"]["temp"] as num).toDouble();

    description = data["weather"][0]["description"].toString();

  });
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Mis tareas"),
      ),

      body: Column(
  children: [

    SizedBox(height: 20),

    Text(
      "Clima en Torreón",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),

    Text(
      "$temperature °C",
      style: TextStyle(fontSize: 32),
    ),

    Text(
      description,
      style: TextStyle(fontSize: 18),
    ),

    SizedBox(height: 20),

    Padding(
      padding: EdgeInsets.all(10),

      child: Row(
        children: [

          Expanded(
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: "Nueva tarea",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          SizedBox(width: 10),

          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {

              taskService.addTask(taskController.text);

              taskController.clear();
            },
          )
        ],
      ),
    ),

    Expanded(
      child: StreamBuilder(
        stream: taskService.getTasks(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tasks.length,

            itemBuilder: (context, index) {

              final task = tasks[index];

              return ListTile(
                title: Text(task['title']),

                trailing: IconButton(
                  icon: Icon(Icons.delete),

                  onPressed: () {
                    taskService.deleteTask(task.id);
                  },
                ),
              );
            },
          );
        },
      ),
    )
  ],
),
    );
  }
}