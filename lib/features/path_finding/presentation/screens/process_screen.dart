import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webspark_test/app/router/app_routes.dart';
import 'package:webspark_test/core/di/locator.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_cubit.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_state.dart';
import 'package:webspark_test/features/path_finding/presentation/widgets/process_error_view.dart';
import 'package:webspark_test/features/path_finding/presentation/widgets/process_loading_view.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({super.key, required this.apiUrl});

  final String apiUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ProcessingCubit>()..startProcessing(apiUrl),
      child: _ProcessView(apiUrl: apiUrl),
    );
  }
}

class _ProcessView extends StatelessWidget {
  const _ProcessView({required this.apiUrl});

  final String apiUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Process screen')),
      body: BlocConsumer<ProcessingCubit, ProcessingState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (s) {
              context.pushReplacement(AppRoutes.resultList, extra: s.results);
            },
          );
        },
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox.shrink(),
            loadingTasks: (_) => const Center(
              child: ProcessLoadingView(message: 'Loading tasks...'),
            ),
            calculating: (s) {
              final percent = s.total > 0 ? (s.completed / s.total) : 0.0;
              final percentString = (percent * 100).toStringAsFixed(0);
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Calculating...'),
                    const SizedBox(height: 16),
                    CircularProgressIndicator(value: percent),
                    const SizedBox(height: 16),
                    Text('$percentString%'),
                  ],
                ),
              );
            },
            ready: (s) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (s.submissionError != null) ...[
                      Text(
                        s.submissionError!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                    ],
                    const Text(
                      'All calculations has finished, you can send your results to server',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProcessingCubit>().submitResults(apiUrl, s.results);
                      },
                      child: const Text('Send results to server'),
                    ),
                  ],
                ),
              );
            },
            submitting: (s) => const Center(
              child: ProcessLoadingView(message: 'Sending results...'),
            ),
            success: (s) {
              return const Center(child: Text('Success! Navigating...'));
            },
            failure: (f) => Center(
              child: ProcessErrorView(message: f.message, apiUrl: apiUrl),
            ),
          );
        },
      ),
    );
  }
}
