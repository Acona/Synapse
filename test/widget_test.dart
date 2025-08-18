import 'package:flutter_test/flutter_test.dart';
import 'package:synapse/main.dart'; // adjust if your package name differs

void main() {
  testWidgets('app builds', (WidgetTester tester) async {
    // Pump the real app root
    await tester.pumpWidget(const SynapseApp());
    // Smoke test: there should be a Home title on first build
    expect(find.text('Home'), findsOneWidget);
  });
}
