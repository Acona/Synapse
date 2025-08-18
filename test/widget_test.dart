import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:synapse/main.dart" as app;

void main() {
  testWidgets("Home renders and counter increments", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const app.SynapseApp());
    await tester.pumpAndSettle();

    // App shell present
    expect(find.byType(NavigationBar), findsOneWidget);

    // Find "Home" specifically in the AppBar (not the bottom nav label)
    final appBarHome = find.descendant(
      of: find.byType(AppBar),
      matching: find.text("Home"),
    );
    expect(appBarHome, findsOneWidget);

    // Main content present
    expect(find.text("Synapse"), findsOneWidget);
    expect(find.text("Count: 0"), findsOneWidget);

    // Increment button works
    await tester.tap(find.widgetWithText(FilledButton, "Increment"));
    await tester.pump();
    expect(find.text("Count: 1"), findsOneWidget);
  });
}
