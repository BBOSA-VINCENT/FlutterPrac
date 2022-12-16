import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: "Hello World",
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text("Hello World"),
//       ),
//       body: const HelloRectangle(),
//     ),
//   ));
// }

class HelloRectangle extends StatelessWidget {
  const HelloRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        height: 200,
        color: Colors.teal[900],
        child: const Center(
          child: Text(
            "Hello!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
