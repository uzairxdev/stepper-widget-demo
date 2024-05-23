import 'package:flutter/material.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper Widget"),
        centerTitle: true,
      ),
      body: Center(
        child: Stepper(
          steps: const [
            Step(
              title: Text("Step 1"),
              content: Text("Information for Step 1"),
            ),
            Step(
              title: Text("Step 2"),
              content: Text("Information for Step 2"),
            ),
            Step(
              title: Text("Step 3"),
              content: Text("Information for Step 3"),
            ),
          ],
          onStepTapped: (int newIndex) {
            setState(() {
              _currentStep = newIndex;
            });
          },
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep != 2) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }
}
