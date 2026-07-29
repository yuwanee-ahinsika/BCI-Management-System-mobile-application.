import 'package:flutter_test/flutter_test.dart';

import 'package:bci_management_system/main.dart';

void main() {
  testWidgets('App launches with BCI Management title',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BCIManagementApp());
    await tester.pumpAndSettle();

    // Verify that the dashboard loads with the app title.
    expect(find.text('BCI Management'), findsOneWidget);
  });
}
