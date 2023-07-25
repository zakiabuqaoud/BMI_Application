
//import from dart flutter
import 'dart:math';
import 'package:flutter/material.dart';

//import my files
import 'package:bmi_tt9/screens/result_screen.dart';
import 'constrains.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryPinkColor,
              secondary: floatingActBtnGreyColor,
            ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: screenBackgroundColor,
        ),
        scaffoldBackgroundColor: screenBackgroundColor,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 60;
  int age = 25;
  int height = 150;
  late double heightSlider = 150;
  bool isMale = true;

  //result
  late double calc;
  late String status;
  late String rangeStatus;
  late String textRangeStatus;
  late String messageStatus;
  late Color statusColor;

  setGender(int type) {
    // if type = 1 ==> male true
    // if type = 2 ==> female false
    if (type == 1) {
      setState(() {
        isMale = true;
      });
    } else {
      setState(() {
        isMale = false;
      });
    }
  }

  void calculateYourHealthy() {
    if(height == 0 || height==200){
      return;
    }
    calc = weight / (pow(height / 100, 2));

    getResult();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          calc: calc,
          status: status,
          rangeStatus: rangeStatus,
          textRangeStatus: textRangeStatus,
          messageStatus: messageStatus,
          colorStatus: statusColor,
        ),
      ),
    );
  }

  void getResult() {
    if (calc <= 16.5) {
      status = "Severely underweight";
      textRangeStatus = "Severely underweight BMI Range";
      rangeStatus = "less than 16.5 kg/m\u00B2";
      statusColor = Colors.deepOrange;
      messageStatus = "Eat healthy food and foods that contain protein.";
    } else if (calc > 16.5 && calc <= 18.5) {
      status = "Underweight";
      rangeStatus = "between 16.5 kg/m\u00B2 and 18.5 kg/m\u00B2";
      textRangeStatus = "Underweight BMI Range";
      statusColor = Colors.orangeAccent;
      messageStatus = "Eat foods that contain protein.";
    } else if (calc > 18.5 && calc <= 25) {
      statusColor = Colors.lightGreen;
      status = "Normal";
      rangeStatus = "between 18.5 kg/m\u00B2 and 25 kg/m\u00B2";
      textRangeStatus = "Underweight BMI Range";
      textRangeStatus = "Normal BMI Range";
      messageStatus = "Eat breakfast, lunch and dinner well with exercise.";
    } else if (calc > 25 && calc <= 30) {
      statusColor = Colors.orangeAccent;
      status = "OverWeight";
      rangeStatus = "between 25 kg/m\u00B2 and 30 kg/m\u00B2";
      textRangeStatus = "OverWeight BMI Range";
      messageStatus = "Eat healthy foods with exercise.";
    } else if (calc > 30 && calc <= 35) {
      statusColor = Colors.redAccent;
      status = "Moderately obese";
      rangeStatus = "between 30 kg/m\u00B2 and 35 kg/m\u00B2";
      textRangeStatus = "Moderately obese BMI Range";
      messageStatus = "Eat healthy foods with sports and do not eat dinner.";
    } else {
      statusColor = Colors.redAccent;
      status = "Severely obese";
      rangeStatus = "over 35 kg/m\u00B2";
      textRangeStatus = "Severely obese BMI Range";
      messageStatus = "Do not overeat and play sports.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: bigFontSize),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          right: 16,
          left: 16,
        ),
        child: Column(
          children: [
            //item 1 : row gender
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: () => setGender(1),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: boxBackgroundColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.male,
                            size: 80,
                            color: isMale ? maleColor : null,
                          ),
                          const Text(
                            "MALE",
                            style: TextStyle(
                                fontSize: midFontSize, color: titleGreyColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                InkWell(
                  onTap: () => setGender(2),
                  child: Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: boxBackgroundColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.female,
                            size: 80,
                            color: isMale ? null : femaleColor,
                          ),
                          const Text(
                            "FEMALE",
                            style: TextStyle(
                                fontSize: midFontSize, color: titleGreyColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //item 2 : height contains slider
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: boxBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                          fontSize: midFontSize, color: titleGreyColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(height.toString(),
                            style: const TextStyle(fontSize: largestFontSize)),
                        const Text(
                          "cm",
                          style: TextStyle(fontSize: smFontSize),
                        ),
                      ],
                    ),
                    Slider(
                      min: 0,
                      max: 200,
                      divisions: 300,
                      value: heightSlider,
                      onChanged: (value) {
                        setState(() {
                          heightSlider = value;
                          height = value.toInt();
                        });
                      },
                      activeColor: primaryPinkColor,
                      inactiveColor: inactiveColor,
                    ),
                  ],
                ),
              ),
            ),
            //item 3 : row weight and age
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: boxBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: midFontSize, color: titleGreyColor),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(fontSize: largestFontSize),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              heroTag: const Text("btn3"),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(fontSize: midFontSize),
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: const Text("btn4"),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(fontSize: midFontSize),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: boxBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(
                              fontSize: midFontSize, color: titleGreyColor),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(fontSize: largestFontSize),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              heroTag: const Text("btn1"),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(fontSize: midFontSize),
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: const Text("btn2"),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(fontSize: midFontSize),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //item 4 : calculate button
            InkWell(
              onTap: calculateYourHealthy,
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: primaryPinkColor,
                ),
                child: const Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
