import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:first_task/main.dart';

void main() {
  testWidgets('AppBar test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app contains the AppBar.
    expect(find.byType(AppBar), findsOneWidget);
  });
}
