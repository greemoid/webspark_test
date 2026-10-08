import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';

final class Grid {
  Grid(List<String> rows) : _rows = List<String>.unmodifiable(rows) {
    if (size < 2 || size > 99) {
      throw ArgumentError.value(size, 'rows.length', 'Expected 2..99');
    }
    for (var y = 0; y < size; y++) {
      if (_rows[y].length != size) {
        throw ArgumentError('Grid must be square: invalid row $y');
      }
      for (final cell in _rows[y].codeUnits) {
        if (cell != 46 && cell != 88) {
          // '.' or 'X'
          throw ArgumentError('Only "." and "X" are allowed: row $y');
        }
      }
    }
  }

  final List<String> _rows;

  int get size => _rows.length;
  int get cellCount => size * size;
  List<String> get rows => _rows;

  bool contains(GridPoint point) =>
      point.x >= 0 && point.y >= 0 && point.x < size && point.y < size;

  bool isWalkable(GridPoint point) =>
      contains(point) && _rows[point.y].codeUnitAt(point.x) == 46;
}
