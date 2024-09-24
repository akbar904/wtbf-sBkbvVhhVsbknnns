
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.counter_app/widgets/increment_button.dart';

// Mock Cubit for simulating the CounterCubit behavior
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('IncrementButton Widget Tests', () {
		late MockCounterCubit mockCounterCubit;

		setUp(() {
			mockCounterCubit = MockCounterCubit();
		});

		testWidgets('IncrementButton displays correctly', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<CounterCubit>(
							create: (_) => mockCounterCubit,
							child: IncrementButton(),
						),
					),
				),
			);

			// Verify if the button with text "Increment" is present
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Increment'), findsOneWidget);
		});

		testWidgets('IncrementButton triggers increment on tap', (WidgetTester tester) async {
			when(() => mockCounterCubit.increment()).thenReturn(null);

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<CounterCubit>(
							create: (_) => mockCounterCubit,
							child: IncrementButton(),
						),
					),
				),
			);

			// Tap the Increment button
			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			// Verify if the increment method was called
			verify(() => mockCounterCubit.increment()).called(1);
		});
	});
}
