# Webspark Flutter Test

A Flutter app that fetches grid tasks, finds the shortest paths, sends the results to the API, and displays them.

## Structure

- `app/` — app setup, routing, and theme configuration.
- `core/` — shared components and utilities that can be reused across features.
- `features/path_finding/` — the complete path-finding flow:
  - `data/` — API calls, local storage, DTOs, and repository implementations.
  - `domain/` — entities, repository interfaces, use cases, and the search algorithm.
  - `presentation/` — screens, Cubits, widgets, and input validation.

There is one feature because URL input, calculation, submission, and result preview are parts of the same flow.

## Path finding

The app uses BFS because every move has the same cost. It finds the shortest path without the extra complexity of weighted search algorithms.

Movement is allowed to any of the eight neighboring cells if the destination is open. For an N×N grid, time and space complexity are O(N²).

Grid validation, movement rules, and path search are separate classes.

## Grid rendering

I initially used GridView.builder, but was not satisfied with the large-grid preview and zooming behavior.

A 99×99 grid contains 9,801 cells. When all cells are visible at once, the main benefit of lazy building is lost.

CustomPainter draws the grid without a separate widget tree for each cell and gives more control over zooming and panning. It displays the already calculated path.

## URL validation

The validator is more detailed than this small app strictly needs. It supports configurable HTTP/HTTPS endpoints and query parameters instead of hardcoding the Webspark address.

A different endpoint can be used as long as it follows the same API contract.

## Tests

Unit and widget tests cover the main scenarios: shortest paths, movement rules, invalid input, API result mapping, processing states, and result screens.

Run tests with:

    flutter test