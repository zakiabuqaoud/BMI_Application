
//import from flutter
import 'package:flutter/material.dart';

//import my files
import '../constrains.dart';
import 'package:bmi_tt9/main.dart';


class ResultScreen extends StatelessWidget {
  final double calc;
  final String status;
  final String rangeStatus;
  final String textRangeStatus;
  final String messageStatus;
  final Color colorStatus;

  const ResultScreen({Key? key, required this.calc, required this.status, required this.rangeStatus, required this.textRangeStatus, required this.messageStatus, required this.colorStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String calcString = calc.toString();
    String calcStringDisplay = calcString.substring(0, 5);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: bigFontSize),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(fontSize: largestNameFontSize),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                ),
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: boxBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Text(
                      status,
                      style: TextStyle(fontSize: lessBigFontSize, color: colorStatus),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      calcStringDisplay,
                      style: const TextStyle(fontSize: largestFontSize),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      textRangeStatus,
                      style: const TextStyle(
                          color: titleGreyColor, fontSize: midFontSize),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      rangeStatus,
                      style: const TextStyle(fontSize: midFontSize),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      messageStatus,
                      style: const TextStyle(fontSize: midFontSize),
                    ),
                    const SizedBox(
                      height: 72,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 20),
                        decoration: BoxDecoration(
                          color: screenBackgroundColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          "SAVE RESULT",
                          style: TextStyle(
                            fontSize: midFontSize,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => InputPage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: primaryPinkColor,
                ),
                child: const Center(
                  child: Text(
                    "Recalculate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
