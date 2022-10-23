import 'package:fh_home_coding/presentation/home/home_page.dart';
import 'package:fh_home_coding/style/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("display area in home page", (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(
      Provider<AppTypography>.value(
        value: AppTypography.fhHome,
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    // Verify that our content is displaying.
    expect(find.byKey(const Key("home_content")), findsOneWidget);
    expect(find.text('empty'), findsNothing);
  });
}
