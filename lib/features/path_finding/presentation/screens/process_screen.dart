import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webspark_test/app/router/app_routes.dart';
import 'package:webspark_test/core/di/locator.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_cubit.dart';
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_state.dart';
import 'package:webspark_test/features/path_finding/presentation/widgets/process_content_view.dart';
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
              return ProcessContentView(
                message: 'Calculating...',
                percent: percent,
                isButtonEnabled: false,
              );
            },
            ready: (s) {
              return ProcessContentView(
                message: 'All calculations has finished, you can send your results to server',
                percent: 1.0,
                isButtonEnabled: true,
                submissionError: s.submissionError,
                onButtonPressed: () {
                  context.read<ProcessingCubit>().submitResults(
                    apiUrl,
                    s.results,
                  );
                },
              );
            },
            submitting: (s) {
              return const ProcessContentView(
                message: 'Sending results...',
                percent: null,
                isButtonEnabled: false,
              );
            },
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
