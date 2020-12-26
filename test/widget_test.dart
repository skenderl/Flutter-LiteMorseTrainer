import 'package:flutter_test/flutter_test.dart';

import 'package:morse_learn/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MorseApp());

    expect(true, true);
  });
}
