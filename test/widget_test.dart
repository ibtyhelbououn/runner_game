import 'package:flutter_test/flutter_test.dart';

import 'package:runner_game/app/app.dart';

void main() {
  testWidgets('Strawberry Sprint app loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RunnerApp());

    expect(find.byType(RunnerApp), findsOneWidget);
  });
}
