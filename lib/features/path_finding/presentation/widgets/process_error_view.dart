import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_cubit.dart';

class ProcessErrorView extends StatelessWidget {
  const ProcessErrorView({
    super.key,
    required this.message,
    required this.apiUrl,
  });

  final String message;
  final String apiUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context.read<ProcessingCubit>().loadTasks(apiUrl);
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
