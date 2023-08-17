import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  int _count = 0;
  double _weightCount = 0;
  List<Set> sets = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                color: Colors.grey.shade900,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          "Reps:",
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 18),
                        ),
                        Container(
                          height: 45,
                          width: 120,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5)),
                          child: Center(
                              child: Text(
                            '$_count',
                            style: const TextStyle(color: Colors.white),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _count--;
                              if (_count < 0) {
                                _count = 0;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: const Icon(
                              Icons.exposure_minus_1,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _count++;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: const Icon(
                              Icons.add,
                              color: Colors.yellow,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Weight:",
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 18),
                        ),
                        Container(
                          height: 45,
                          width: 120,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5)),
                          child: Center(
                              child: Text(
                            "$_weightCount",
                            style: const TextStyle(color: Colors.white),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _weightCount--;
                              if (_weightCount < 0) {
                                _weightCount = 0;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: const Icon(
                              Icons.exposure_minus_1,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _weightCount++;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.yellow),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: const Icon(
                              Icons.add,
                              color: Colors.yellow,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 255, 230, 0),
                height: 50,
                child: TextButton(
                    onPressed: () {
                      Map<String, dynamic> data = {
                        "field1": _count,
                        "field2": _weightCount
                      };
                      FirebaseFirestore.instance.collection("users").add(data);
                      if (_count != 0 && _weightCount != 0) {
                        setState(() {
                          sets.add(Set(reps: _count, weights: _weightCount));
                        });
                      }
                    },
                    child: const Center(
                        child: Text(
                      "COMPLETE SET",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Today's Session",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 20),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: sets.length,
                    itemBuilder: (context, index) => getList(index),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Previous Session",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "View History",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.yellow,
                        fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getList(int index) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Reps: ${sets[index].reps}",
            style: TextStyle(color: Colors.grey.shade400),
          ),
          Text(
            "Weights:${sets[index].weights} kg",
            style: TextStyle(color: Colors.grey.shade400),
          ),
          Text(
            "e1RM: ",
            style: TextStyle(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}

class Set {
  int reps;
  double weights;
  Set({required this.reps, required this.weights});
}
