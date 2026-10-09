import 'package:flutter/material.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/presentation/widgets/path_grid_view.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key, required this.result});

  final PathResult result;

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  bool _isGridFocused = false;

  void _onInteractionChanged(bool isInteracting) {
    if (_isGridFocused != isInteracting) {
      setState(() {
        _isGridFocused = isInteracting;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.result.field.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Preview screen')),
        body: const Center(child: Text('Invalid field data')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Preview screen')),
      body: SingleChildScrollView(
        physics: _isGridFocused ? const NeverScrollableScrollPhysics() : null,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PathGridView(
                result: widget.result,
                onInteractionStateChanged: _onInteractionChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                widget.result.path.isEmpty
                    ? 'No path found'
                    : widget.result.path,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
