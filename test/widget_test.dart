import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:owwn_coding_challenge/domain/providers/providers.dart';
import 'package:owwn_coding_challenge/domain/repository/owwn_repository.dart';
import 'package:owwn_coding_challenge/main.dart';

void main() {
  testWidgets(
    'Users list loads the first page and fails on the second page',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            owwnRepoProvider.overrideWithValue(
              MockOWWNRepository(),
            )
          ],
          child: const MyApp(),
        ),
      );
      await tester.pump();
      expect(find.text('Log in'), findsOneWidget);

      await tester.tap(find.text('Log in'));

      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Log in'), findsNothing);
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Active'), findsOneWidget);

      expect(find.byIcon(Icons.keyboard_arrow_right_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.keyboard_arrow_right_rounded));
      await tester.pump(
        const Duration(seconds: 1),
      );
      expect(find.text('Active'), findsNothing);
    },
  );
}
