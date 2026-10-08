import 'package:flutter/material.dart';

class ProcessLoadingView extends StatelessWidget {
  const ProcessLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'All calculations has finished, you can send\nyour results to server',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
