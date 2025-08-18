import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

// Import the app via relative path so we don't care what pubspec name is.
import "../lib/main.dart" as app;

void main() {
  testWidgets("app builds Home screen", (WidgetTester tester) async {
    await tester.pumpWidget(const app.SynapseApp());
    // First frame
    await tester.pumpAndSettle();

    // Smoke checks: title and counter exist
    expect(find.text("Home"), findsOneWidget);
    expect(find.text("Count: 0"), findsOneWidget);

    // Tap the button and verify increment works (basic state test)
    await tester.tap(find.widgetWithText(FilledButton, "Increment"));
    await tester.pump(); // one frame after tap
    expect(find.text("Count: 1"), findsOneWidget);
  });
}
