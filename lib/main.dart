import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  TextEditingController startDateInput = TextEditingController();
  TextEditingController endDateInput = TextEditingController();

  @override
  void initState() {
    startDateInput.text = ""; //set the initial value of text field
    endDateInput.text = "";
    super.initState();
  }

  // @override
  // void dispose() {
  //   startDateInput.clear();
  //   endDateInput.clear();
  //   super.dispose();
  // }

  void cancel() {
    startDateInput.clear();
    endDateInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Checklist R&D"),
        centerTitle: true,
        backgroundColor: Colors.teal, //background color of app bar
      ),
      body: Column(
        children: [
          TextField(
            controller: startDateInput,
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today), labelText: "Start Date"),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                print(pickedDate);
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(formattedDate);

                setState(() {
                  startDateInput.text = formattedDate;
                });
              } else {
                print("Date is not selected");
              }
            },
          ),
          const SizedBox(
            height: 15.0,
          ),
          TextField(
            controller: endDateInput,
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today), labelText: "End Date"),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                print(pickedDate);
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(formattedDate);

                setState(() {
                  endDateInput.text = formattedDate;
                });
              } else {
                print("Date is not selected");
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    // DateTime? pickedDate = DateFormat('dd-MM-yyyy')
                    //     .format(DateTime.now()) as DateTime?;
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate);

                      setState(() {
                        startDateInput.text = formattedDate;
                        endDateInput.text = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('Today')),
              const SizedBox(
                width: 20.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  cancel();
                },
                icon: const Icon(Icons.close),
                label: const Text('Cancel'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
              ),
            ],
          )
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () async {
          //         DateTime? pickedDate = await showDatePicker(
          //             context: context,
          //             initialDate: DateTime.now(),
          //             firstDate: DateTime(
          //                 2000), //DateTime.now() - not to allow to choose before today.
          //             lastDate: DateTime(2101));
          //
          //         if (pickedDate != null) {
          //           print(
          //               pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          //           String formattedDate =
          //               DateFormat('yyyy-MM-dd').format(pickedDate);
          //           print(
          //               formattedDate); //formatted date output using intl package =>  2021-03-16
          //           //you can implement different kind of Date Format here according to your requirement
          //
          //           setState(() {
          //             startDateInput.text =
          //                 formattedDate; //set output date to TextField value.
          //           });
          //         } else {
          //           print("Date is not selected");
          //         }
          //       },
          //       child: Row(children: [
          //         Radio(
          //           value: 0,
          //           groupValue: radioGroupValue,
          //           onChanged: _handleRadioValueWkotType,
          //         ),
          //         const Text("label 1"),
          //         // Radio(
          //         //   value: 1,
          //         //   groupValue: radioGroupValue,
          //         //   onChanged: _handleRadioValueWkotType,
          //         // ),
          //         // const Text("label 2"),
          //       ]),
          //     ),
          //     const SizedBox(
          //       width: 5.0,
          //     ),
          //     GestureDetector(
          //       onTap: () async {
          //         DateTime? pickedDate = await showDatePicker(
          //             context: context,
          //             initialDate: DateTime.now(),
          //             firstDate: DateTime.now() //DateTime.now() - not to allow to choose before today.
          //             lastDate: DateTime(2101));
          //
          //         if (pickedDate != null) {
          //           print(
          //               pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          //           String formattedDate =
          //               DateFormat('yyyy-MM-dd').format(pickedDate);
          //           print(
          //               formattedDate); //formatted date output using intl package =>  2021-03-16
          //           //you can implement different kind of Date Format here according to your requirement
          //
          //           setState(() {
          //             endDateInput.text =
          //                 formattedDate; //set output date to TextField value.
          //           });
          //         } else {
          //           print("Date is not selected");
          //         }
          //       },
          //       child: Row(children: [
          //         Radio(
          //           value: 1,
          //           groupValue: radioGroupValue,
          //           onChanged: _handleRadioValueWkotType,
          //         ),
          //         const Text("label 2"),
          //       ]),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  // void _handleRadioValueWkotType(int? value) {
  //   setState(() {
  //     radioGroupValue = value!;
  //   });
  // }
}
