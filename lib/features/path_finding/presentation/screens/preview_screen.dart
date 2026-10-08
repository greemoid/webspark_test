import 'package:flutter/material.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/core/ui/theme/app_colors.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.result});

  final PathResult result;

  @override
  Widget build(BuildContext context) {
    if (result.field.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Preview screen')),
        body: const Center(child: Text('Invalid field data')),
      );
    }

    final gridSize = result.field.length;
    final stepsSet = result.steps.toSet();
    final start = result.steps.isNotEmpty ? result.steps.first : null;
    final end = result.steps.isNotEmpty ? result.steps.last : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Preview screen')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridSize,
                  ),
                  itemCount: gridSize * gridSize,
                  itemBuilder: (context, index) {
                    final y = index ~/ gridSize;
                    final x = index % gridSize;
                    final point = GridPoint(x: x, y: y);

                    final isBlocked = result.field[y][x] == 'X';
                    final isStart = point == start;
                    final isEnd = point == end;
                    final isPath =
                        stepsSet.contains(point) && !isStart && !isEnd;

                    Color backgroundColor = AppColors.gridEmpty;
                    if (isStart) {
                      backgroundColor = AppColors.gridStart;
                    } else if (isEnd) {
                      backgroundColor = AppColors.gridEnd;
                    } else if (isPath) {
                      backgroundColor = AppColors.gridPath;
                    } else if (isBlocked) {
                      backgroundColor = AppColors.gridBlocked;
                    }

                    Color textColor = (isBlocked || isPath || isEnd)
                        ? AppColors.textLight
                        : AppColors.textDark;

                    if (isStart) textColor = AppColors.textDark;

                    return Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: Center(
                        child: Text(
                          '($x,$y)',
                          style: TextStyle(color: textColor, fontSize: 10),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              result.path,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
