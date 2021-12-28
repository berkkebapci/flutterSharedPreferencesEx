import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example/result.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    readySharedPreferences().whenComplete(() => setState(() {}));
  }

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurname = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerJob = TextEditingController();

  Future<void> readySharedPreferences() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    _controllerName.text =
        sharedPreferences.getString("controllerName") ?? "".toString();
    _controllerName.text =
        sharedPreferences.getString("controllerSurname") ?? "".toString();
    _controllerName.text =
        sharedPreferences.getString("controllerAge") ?? "".toString();
    _controllerName.text =
        sharedPreferences.getString("controllerJob") ?? "".toString();
    setState(() {});
  }

  Future<void> saveData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "controllerName", _controllerName.value.toString());
    sharedPreferences.setString(
        "controllerSurname", _controllerSurname.value.toString());
    sharedPreferences.setString(
        "controllerAge", _controllerAge.value.toString());
    sharedPreferences.setString(
        "controllerJob", _controllerJob.value.toString());
  }

  Future<void> deleteData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("controllerName");
    sharedPreferences.remove("controllerSurname");
    sharedPreferences.remove("controllerAge");
    sharedPreferences.remove("controllerJob");
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerSurname.dispose();
    _controllerAge.dispose();
    _controllerJob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shared Preferences"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: _controllerName,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: _controllerSurname,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Surname',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: _controllerAge,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: _controllerJob,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Job',
                ),
              ),
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.purple,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Send Data Other Screen',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Result(_controllerName.text, _controllerSurname.text,
                      _controllerAge.text, _controllerJob.text);
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
