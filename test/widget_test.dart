import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:malshi_profile/main.dart';

void main() {
  testWidgets('Profile displays supplied details and increments points', (tester) async {
    await tester.pumpWidget(const ProfileApp());
    expect(find.text('malshi'), findsOneWidget);
    expect(find.text('malshikushara@gmail.com'), findsOneWidget);
    expect(tester.widget<Text>(find.byKey(const Key('pointsValue'))).data, '0');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(tester.widget<Text>(find.byKey(const Key('pointsValue'))).data, '1');
  });
}
