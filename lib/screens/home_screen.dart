import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widget/left.dart';
import '../Widget/right.dart';

class MyBmi extends StatelessWidget {
  const MyBmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade800,
      ),
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.black,
          ),
          body: const Bmi(),
        ),
      ),
    );
  }
}

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  bool tcVisibility = false;
  String bmitext = '';
  String weighttotal = '0';
  String heighttotal = '0';
  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerHeight = TextEditingController();
  String calculateBmi(double weight, double height) {
    return (weight / ((height / 100) * (height / 100))).toStringAsFixed(2);
  }

  final _formkey = GlobalKey<FormState>();
  String total = '0.00';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.yellow.shade400,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: controllerWeight,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r"[a-z]+"))
                      ],
                      style:
                          const TextStyle(color: Colors.orange, fontSize: 20),
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixText: 'Kg',
                        labelText: 'Weight',
                        labelStyle:
                            const TextStyle(color: Colors.blue, fontSize: 25),
                        prefixIcon: const Icon(
                          Icons.line_weight,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controllerHeight,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r"[a-z]+"))
                      ],
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red,
                      style:
                          const TextStyle(color: Colors.orange, fontSize: 20),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixText: 'cm',
                        labelText: 'Height',
                        labelStyle:
                            const TextStyle(color: Colors.blue, fontSize: 25),
                        prefixIcon: const Icon(
                          Icons.height,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            child: Text(
              'Calculate',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.yellow.shade400,
              ),
            ),
            onPressed: () {
              _formkey.currentState!.validate()
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Success.'),
                      ),
                    )
                  : ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Your inputs is not valid.',
                        ),
                      ),
                    );
              setState(() {
                total = calculateBmi(double.parse(controllerWeight.text),
                    double.parse(controllerHeight.text));
                if (double.parse(total) < 18.5) {
                  bmitext = 'You must gain weight.🫣';
                }

                if (double.parse(total) > 25) {
                  bmitext = 'You must lose weight.😱';
                }
                if (double.parse(total) > 18.5 && double.parse(total) < 25) {
                  bmitext = 'You are normal.😊';
                }
                FocusManager.instance.primaryFocus?.unfocus();
                tcVisibility = true;
              });
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Visibility(
            visible: tcVisibility,
            child: Text(
              // ignore: unnecessary_string_interpolations
              '$total',
              style: const TextStyle(fontSize: 65, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            // ignore: unnecessary_string_interpolations
            '$bmitext',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Right(rightWidth: 160),
          const SizedBox(
            height: 30,
          ),
          const Right(rightWidth: 110),
          const SizedBox(
            height: 30,
          ),
          const Right(rightWidth: 135),
          const SizedBox(
            height: 50,
          ),
          const Left(leftWidth: 145),
          const SizedBox(
            height: 30,
          ),
          const Left(leftWidth: 110),
        ],
      ),
    );
  }
}
