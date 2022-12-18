import 'dart:developer';

import 'package:flutter/material.dart';

enum FirstName { fName }

class Prac extends StatefulWidget {
  const Prac({super.key});

  @override
  State<Prac> createState() => _PracState();
}

class _PracState extends State<Prac> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton<FirstName>(onSelected: ((value) {
              log("fooo");
            }), itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: FirstName.fName,
                  child: Text("First Name"),
                )
              ];
            })
          ],
          title: const Text("Prac Page"),
        ),
        body: Container(
          width: 600,
          padding: const EdgeInsets.all(100),
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.teal,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      color: const Color.fromARGB(255, 212, 9, 43),
                    ),
                  ],
                ),
              )

              // Column(
              //   children: const [Icon(), Text("data")],
              // ),
              // Column(
              //   children: const [Icon(), Text("data")],
              // ),
              // Column(
              //   children: [Icon(), Container(child: Text("data"))],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
