import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';

class ResultListScreen extends StatelessWidget {
  const ResultListScreen({super.key, required this.results});

  final List<PathResult> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result list screen')),
      body: ListView.separated(
        itemCount: results.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final result = results[index];
          return ListTile(
            title: Text(
              result.path.isEmpty ? 'No path found' : result.path,
              textAlign: TextAlign.center,
              style: result.path.isEmpty
                  ? const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    )
                  : null,
            ),
            onTap: () {
              context.push('/preview', extra: result);
            },
          );
        },
      ),
    );
  }
}
