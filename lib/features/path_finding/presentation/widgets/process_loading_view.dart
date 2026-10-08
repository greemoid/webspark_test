import 'package:flutter/material.dart';

class ProcessLoadingView extends StatelessWidget {
  const ProcessLoadingView({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
