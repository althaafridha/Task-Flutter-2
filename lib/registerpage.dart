import 'dart:ffi';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

const List<String> list = <String>['Islam', 'Kristen', 'Hindu', 'Budha'];

class _RegisterPageState extends State<RegisterPage> {
  String groupValue = "Laki - Laki";
  String dropdownValue = list.first;
  TextEditingController nameController = TextEditingController();
  TextEditingController mottoController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Register Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                  hintText: 'Nama Lengkap',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                obscureText: true,
                controller: passController,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: mottoController,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: 'Motto Hidup',
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: RadioListTile(
                        value: "Laki - Laki",
                        title: const Text("Laki - Laki"),
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value.toString();
                          });
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        value: "Perempuan",
                        title: const Text("Perempuan"),
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value.toString();
                          });
                        }),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text("Agama: "),
              const SizedBox(height: 10),
              DropdownButton(
                  value: dropdownValue,
                  isExpanded: true,
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  }),
              const SizedBox(height: 12),
              MaterialButton(
                onPressed: () {
                  checkIfNameIsEmpty();
                },
                child: const Text("Submit"),
                color: Colors.red,
                textColor: Colors.white,
              ),
              const SizedBox(height: 16),
              Text(errorMessage,
                  style: const TextStyle(
                    color: Colors.redAccent,
                  )),
            ],
          ),
        ));
  }

  void checkIfNameIsEmpty() {
    if (nameController.text.isEmpty ||
        mottoController.text.isEmpty ||
        passController.text.isEmpty) {
      setState(() {
        errorMessage = "Field can't be empty";
      });
    } else {
      errorMessage = "";
      showData();
    }
  }

  void showData() {
    errorMessage = "";
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama: ${nameController.text}",
                  style: const TextStyle(color: Colors.white),
                ),
                Text("Password: ${passController.text}",
                    style: const TextStyle(color: Colors.white)),
                Text(
                  "Motto: ${mottoController.text}",
                  style: const TextStyle(color: Colors.white),
                ),
                Text("Jenis Kelamin: $groupValue",
                    style: const TextStyle(color: Colors.white)),
                Text("Agama: $dropdownValue",
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          );
        });
  }
}
