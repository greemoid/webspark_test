import 'package:flutter/material.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/core/ui/theme/app_colors.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/presentation/widgets/grid_painter.dart';

class PathGridView extends StatefulWidget {
  const PathGridView({
    super.key,
    required this.result,
    required this.onInteractionStateChanged,
  });

  final PathResult result;
  final ValueChanged<bool> onInteractionStateChanged;

  @override
  State<PathGridView> createState() => _PathGridViewState();
}

class _PathGridViewState extends State<PathGridView> {
  final TransformationController _transformationController =
      TransformationController();
  late List<Color> _cellColors;
  late int _gridSize;
  int _activePointers = 0;
  bool _isResetScheduled = false;
  double _currentScale = 1.0;
  bool _lastInteractionState = false;
  bool _scaleEnabled = false;

  @override
  void initState() {
    super.initState();
    _prepareData();
    _transformationController.addListener(_onTransformChanged);
  }

  @override
  void didUpdateWidget(PathGridView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.result != widget.result) {
      _prepareData();
      _transformationController.value = Matrix4.identity();
    }
  }

  void _prepareData() {
    _gridSize = widget.result.field.length;
    if (_gridSize == 0) return;

    _cellColors = List<Color>.filled(
      _gridSize * _gridSize,
      AppColors.gridEmpty,
    );

    final stepsSet = widget.result.steps.toSet();
    final start = widget.result.steps.isNotEmpty
        ? widget.result.steps.first
        : null;
    final end = widget.result.steps.isNotEmpty
        ? widget.result.steps.last
        : null;

    for (int y = 0; y < _gridSize; y++) {
      for (int x = 0; x < _gridSize; x++) {
        final point = GridPoint(x: x, y: y);
        final isBlocked = widget.result.field[y][x] == 'X';
        final isStart = point == start;
        final isEnd = point == end;
        final isPath = stepsSet.contains(point) && !isStart && !isEnd;

        _cellColors[y * _gridSize + x] = _getCellColor(
          isStart: isStart,
          isEnd: isEnd,
          isPath: isPath,
          isBlocked: isBlocked,
        );
      }
    }
  }

  Color _getCellColor({
    required bool isStart,
    required bool isEnd,
    required bool isPath,
    required bool isBlocked,
  }) {
    if (isStart) return AppColors.gridStart;
    if (isEnd) return AppColors.gridEnd;
    if (isPath) return AppColors.gridPath;
    if (isBlocked) return AppColors.gridBlocked;
    return AppColors.gridEmpty;
  }

  void _onTransformChanged() {
    final scale = _transformationController.value.getMaxScaleOnAxis();
    if (scale != _currentScale) {
      setState(() {
        _currentScale = scale;
      });
      _checkInteraction();
    }

    if (scale <= 1.001 &&
        _transformationController.value != Matrix4.identity()) {
      if (!_isResetScheduled) {
        _isResetScheduled = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            final currentScale = _transformationController.value
                .getMaxScaleOnAxis();
            if (currentScale <= 1.001) {
              _transformationController.value = Matrix4.identity();
            }
          }
          _isResetScheduled = false;
        });
      }
    }
  }

  void _checkInteraction() {
    if (_activePointers < 0) _activePointers = 0;

    final bool isZoomed = _currentScale > 1.001;
    final bool isInteracting =
        _scaleEnabled &&
        (_activePointers > 1 || (isZoomed && _activePointers > 0));

    if (isInteracting != _lastInteractionState) {
      _lastInteractionState = isInteracting;
      widget.onInteractionStateChanged(isInteracting);
    }
  }

  @override
  void dispose() {
    _transformationController.removeListener(_onTransformChanged);
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_gridSize == 0) return const SizedBox.shrink();

    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final side = constraints.maxWidth;
          final cellSize = side / _gridSize;

          _scaleEnabled = cellSize < 40;
          final double maxScale = _scaleEnabled ? 40 / cellSize : 1.0;
          final bool isZoomed = _currentScale > 1.001;

          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            child: Listener(
              onPointerDown: (_) {
                _activePointers++;
                _checkInteraction();
              },
              onPointerUp: (_) {
                _activePointers--;
                _checkInteraction();
              },
              onPointerCancel: (_) {
                _activePointers--;
                _checkInteraction();
              },
              child: InteractiveViewer(
                transformationController: _transformationController,
                constrained: true,
                boundaryMargin: EdgeInsets.zero,
                minScale: 1.0,
                maxScale: maxScale,
                scaleEnabled: _scaleEnabled,
                panEnabled: isZoomed,
                child: CustomPaint(
                  size: Size(side, side),
                  painter: GridPainter(
                    gridSize: _gridSize,
                    cellColors: _cellColors,
                    transformNotifier: _transformationController,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
