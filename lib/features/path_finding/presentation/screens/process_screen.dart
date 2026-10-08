import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      create: (context) => locator<ProcessingCubit>()..loadTasks(apiUrl),
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
      body: BlocBuilder<ProcessingCubit, ProcessingState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox.shrink(),
            loading: (_) => const Center(child: ProcessLoadingView()),
            loaded: (s) {
              if (s.tasks.isEmpty) {
                return const Center(child: Text('No tasks received.'));
              }
              return Center(child: Text('Received ${s.tasks.length} tasks!'));
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
