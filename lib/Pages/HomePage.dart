import 'package:body_mass_index/Widget/ElevatedButtonPro.dart';
import 'package:body_mass_index/Pages/ResultPage.dart';
import 'package:body_mass_index/Widget/TextProporties.dart';
import 'package:body_mass_index/ProviderSetting/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double SliderValuelength = 170;
  double SliderValueweight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BODY MASS İNDEX"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.dark_mode_sharp,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 103,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextProporties("LENGTH   : "),
                          TextProporties(
                              SliderValuelength.roundToDouble().toString()),
                        ],
                      ),
                      Slider(
                          value: SliderValuelength,
                          min: 0,
                          max: 250,
                          activeColor: Colors.purple,
                          divisions: 250,
                          label: SliderValuelength.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              SliderValuelength = value;
                            });
                          })
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 103,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextProporties("WEIGHT   : "),
                          TextProporties(
                              SliderValueweight.roundToDouble().toString()),
                        ],
                      ),
                      Slider(
                          value: SliderValueweight,
                          min: 0,
                          max: 190,
                          activeColor: Colors.purple,
                          label: SliderValueweight.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              SliderValueweight = value;
                            });
                          })
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
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResulPage(
                            SliderValuelength.round(),
                            SliderValueweight.round())));
              }, "CALCULATOR"),
            ],
          ),
        ),
      ),
    );
  }
}
