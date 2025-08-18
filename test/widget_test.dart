import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:synapse/main.dart"
    as app; // <- package import (no relative path)

void main() {
  testWidgets("Home renders and counter increments", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const app.SynapseApp());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text("Home"), findsOneWidget);
    expect(find.text("Synapse"), findsOneWidget);
    expect(find.text("Count: 0"), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, "Increment"));
    await tester.pump();
    expect(find.text("Count: 1"), findsOneWidget);
  });
}
