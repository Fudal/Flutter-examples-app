import 'package:flutter/material.dart';
import 'package:get_weather/style/dimens.dart';
import 'package:get_weather/style/typography.dart';
import 'package:get_weather/widgets/outline_rounded_button.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final String leftButtonText;
  final String rightButtonText;
  final Function() onLeftButtonClick;
  final Function() onRightButtonClick;

  const CustomDialog({
    required this.message,
    required this.onLeftButtonClick,
    required this.onRightButtonClick,
    required this.leftButtonText,
    required this.rightButtonText,
    super.key,
  });

  Future<dynamic> show(BuildContext context) => showDialog(
    barrierColor: Colors.black.withOpacity(0.4),
    context: context,
    builder: (context) => this,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacingL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: AppTypography.of(context).body1,
            ),
            const SizedBox(height: Dimens.spacingS),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineRoundedButton(
                  text: leftButtonText,
                  onPressed: onLeftButtonClick.call,
                ),
                OutlineRoundedButton(
                  text: rightButtonText,
                  onPressed: onRightButtonClick.call,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
