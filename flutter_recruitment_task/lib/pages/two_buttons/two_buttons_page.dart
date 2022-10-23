import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/pages/two_buttons/button_two_states.dart';

class TwoButtonsPage extends StatefulWidget {
  @override
  _TwoButtonsPageState createState() => _TwoButtonsPageState();
}

class _TwoButtonsPageState extends State<TwoButtonsPage> {
  final List<bool> _buttonIsOn = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2-state buttons'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTwoStates(
              isOn: _buttonIsOn[0],
              onChange: (bool isOn) {
                _onButtonValueChange(index: 0, isOn: isOn);
              },
            ),
            const SizedBox(width: 8),
            ButtonTwoStates(
              isOn: _buttonIsOn[1],
              onChange: (bool isOn) {
                _onButtonValueChange(index: 1, isOn: isOn);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onButtonValueChange({
    required int index, 
    required bool isOn,
  }) {

    if (index == 0) {
      _buttonIsOn[1] = !isOn;
      _buttonIsOn[0] = isOn;
    } else if (index == 1) {
      _buttonIsOn[0] = !isOn;
      _buttonIsOn[1] = isOn;
    }

    // _buttonIsOn[index] = isOn;

    setState(() {});
  }
}
