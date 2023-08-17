import 'package:flutter/material.dart';
import 'package:project/components/exercise/primary_muscle.dart';

class AddExercise extends StatefulWidget {
  final String? temp;
  const AddExercise({super.key, this.temp});

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text(
          "New Exercise",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Center(
                  child: Text(
                "Cancel",
                style: TextStyle(color: Colors.yellow, fontSize: 16),
              )),
            )),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.yellow, fontSize: 16),
              ))
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.grey.shade900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.temp == null ? "sales" : '${widget.temp}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrimaryMuscle(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey.shade900,
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.grey.shade400),
                decoration: InputDecoration(
                    hintText: "Exercise Name",
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    fillColor: Colors.grey.shade900,
                    filled: true),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey.shade900,
              child: TextField(
                style: TextStyle(color: Colors.grey.shade400),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Description (Optional)",
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    fillColor: Colors.grey.shade900,
                    filled: true),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.grey.shade900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Other Muscles Worked",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
