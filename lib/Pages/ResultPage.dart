import 'package:body_mass_index/Widget/ElevatedButtonPro.dart';
import 'package:body_mass_index/Pages/HomePage.dart';
import 'package:body_mass_index/Widget/TextProporties.dart';
import 'package:flutter/material.dart';

class ResulPage extends StatelessWidget {
  int? boy;
  int? kilo;
  ResulPage(this.boy, this.kilo, {Key? key}) : super(key: key);

  double bodyMassIndex() {
    return (kilo!) / ((boy! / 100) * (boy! / 100));
  }

  String bmiResult() {
    double bmi = bodyMassIndex();
    if (bmi >= 40) {
      return "Class 3 obesity (morbid obesity)";
    } else if (bmi >= 35 && bmi < 40) {
      return "Class 2 obesity";
    } else if (bmi >= 30 && bmi < 35) {
      return "Class 1 obesity";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RESULT PAGE"),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 103,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextProporties("BODY MASS INDEX : "),
                        TextProporties(bodyMassIndex().round().toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextProporties("RESULT : "),
                        TextProporties(bmiResult()),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple,
                      blurRadius: 5,
                      offset: Offset(1, 5), // Shadow position
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButtonPro(() {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }, "BACK"),
          ],
        ),
      ),
    );
  }
}
