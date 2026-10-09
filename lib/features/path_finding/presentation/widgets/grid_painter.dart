import 'package:flutter/material.dart';
import 'package:webspark_test/core/ui/theme/app_colors.dart';

class GridPainter extends CustomPainter {
  GridPainter({
    required this.gridSize,
    required this.cellColors,
    required this.transformNotifier,
  }) : super(repaint: transformNotifier);

  final int gridSize;
  final List<Color> cellColors;
  final ValueNotifier<Matrix4> transformNotifier;

  static final Map<int, TextPainter> _textPainters = {};
  static double _lastCellWidth = 0;

  @override
  void paint(Canvas canvas, Size size) {
    if (gridSize == 0) return;

    final cellWidth = size.width / gridSize;
    final cellHeight = size.height / gridSize;

    if ((cellWidth - _lastCellWidth).abs() > 0.01) {
      _textPainters.clear();
      _lastCellWidth = cellWidth;
    }

    final matrix = transformNotifier.value;
    final scale = matrix.getMaxScaleOnAxis();
    final dx = matrix.getTranslation().x;
    final dy = matrix.getTranslation().y;

    final localLeft = -dx / scale;
    final localTop = -dy / scale;
    final localRight = (size.width - dx) / scale;
    final localBottom = (size.height - dy) / scale;

    final int startX = (localLeft / cellWidth).floor().clamp(0, gridSize - 1);
    final int startY = (localTop / cellHeight).floor().clamp(0, gridSize - 1);
    final int endX = (localRight / cellWidth).ceil().clamp(0, gridSize - 1);
    final int endY = (localBottom / cellHeight).ceil().clamp(0, gridSize - 1);

    final paint = Paint()..style = PaintingStyle.fill;

    for (int y = startY; y <= endY; y++) {
      for (int x = startX; x <= endX; x++) {
        final color = cellColors[y * gridSize + x];
        if (color != AppColors.gridEmpty) {
          paint.color = color;
          canvas.drawRect(
            Rect.fromLTWH(x * cellWidth, y * cellHeight, cellWidth, cellHeight),
            paint,
          );
        }
      }
    }

    final linePaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5 / scale;

    for (int i = startX; i <= endX + 1; i++) {
      final double x = i * cellWidth;
      canvas.drawLine(Offset(x, localTop), Offset(x, localBottom), linePaint);
    }
    for (int i = startY; i <= endY + 1; i++) {
      final double y = i * cellHeight;
      canvas.drawLine(Offset(localLeft, y), Offset(localRight, y), linePaint);
    }

    final screenCellSize = cellWidth * scale;
    if (screenCellSize >= 20) {
      final fontSize = cellWidth * 0.22;

      if (_textPainters.length > 5000) {
        _textPainters.clear();
      }

      for (int y = startY; y <= endY; y++) {
        for (int x = startX; x <= endX; x++) {
          final index = y * gridSize + x;
          final color = cellColors[index];

          Color textColor = AppColors.textDark;
          if (color == AppColors.gridBlocked) {
            textColor = AppColors.textLight;
          }

          final cacheKey = Object.hash(index, textColor.toARGB32());
          TextPainter? textPainter = _textPainters[cacheKey];
          if (textPainter == null) {
            textPainter = TextPainter(
              text: TextSpan(
                text: '($x,$y)',
                style: TextStyle(color: textColor, fontSize: fontSize),
              ),
              textDirection: TextDirection.ltr,
            );
            textPainter.layout();
            _textPainters[cacheKey] = textPainter;
          }

          textPainter.paint(
            canvas,
            Offset(
              x * cellWidth + (cellWidth - textPainter.width) / 2,
              y * cellHeight + (cellHeight - textPainter.height) / 2,
            ),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter oldDelegate) {
    return oldDelegate.gridSize != gridSize ||
        oldDelegate.cellColors != cellColors;
  }
}
