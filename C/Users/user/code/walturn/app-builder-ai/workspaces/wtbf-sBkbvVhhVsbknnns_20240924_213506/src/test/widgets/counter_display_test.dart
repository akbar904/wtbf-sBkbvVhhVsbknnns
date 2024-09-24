
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/widgets/counter_display.dart';

void main() {
	group('CounterDisplay Widget Tests', () {
		testWidgets('displays the initial counter value', (WidgetTester tester) async {
			// Arrange
			const initialCounterValue = 0;

			// Act
			await tester.pumpWidget(const CounterDisplay(counterValue: initialCounterValue));

			// Assert
			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('displays the updated counter value', (WidgetTester tester) async {
			// Arrange
			const updatedCounterValue = 10;

			// Act
			await tester.pumpWidget(const CounterDisplay(counterValue: updatedCounterValue));

			// Assert
			expect(find.text('10'), findsOneWidget);
		});
	});
}
