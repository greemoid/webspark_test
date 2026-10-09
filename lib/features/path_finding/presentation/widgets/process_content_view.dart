import 'package:flutter/material.dart';
import 'package:webspark_test/core/ui/widgets/primary_button.dart';

class ProcessContentView extends StatelessWidget {
  const ProcessContentView({
    super.key,
    required this.message,
    this.percent,
    required this.isButtonEnabled,
    this.onButtonPressed,
    this.submissionError,
  });

  final String message;
  final double? percent;
  final bool isButtonEnabled;
  final VoidCallback? onButtonPressed;
  final String? submissionError;

  @override
  Widget build(BuildContext context) {
    final percentString = percent != null
        ? (percent! * 100).toStringAsFixed(0)
        : null;

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (submissionError != null) ...[
                  Text(
                    submissionError!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                ],
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                if (percentString != null)
                  Text(
                    '$percentString%',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: percent,
                    strokeWidth: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryButton(
                  text: 'Send results to server',
                  onPressed: isButtonEnabled ? onButtonPressed : null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
