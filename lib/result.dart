import "package:flutter/material.dart";

class Result extends StatefulWidget {
  final String name, surname, age, job;
  const Result(
    this.name,
    this.surname,
    this.age,
    this.job, {
    Key? key,
  }) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Shared Preferences Result"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Name: " + widget.name,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Your Surname: " + widget.surname,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Your Age: " + widget.age,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Your Job: " + widget.job,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
