
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/screens/home_screen.dart';
import 'package:counter_app/cubits/counter_cubit.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		// Create a Mock CounterCubit instance
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		testWidgets('should display initial counter value', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: const HomeScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('should display updated counter value when incremented', (WidgetTester tester) async {
			whenListen(counterCubit, Stream.fromIterable([0, 10]), initialState: 0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: const HomeScreen(),
					),
				),
			);

			await tester.pump();

			expect(find.text('10'), findsOneWidget);
		});

		testWidgets('should call increment method when increment button is pressed', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: const HomeScreen(),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => counterCubit.increment()).called(1);
		});
	});
}
