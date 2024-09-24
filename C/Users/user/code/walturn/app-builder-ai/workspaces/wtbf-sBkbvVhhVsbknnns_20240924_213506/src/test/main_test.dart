
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
	group('Main App Initialization', () {
		testWidgets('App should display HomeScreen widget', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('CounterCubit Tests', () {
		blocTest<CounterCubit, Counter>(
			'CounterCubit initial state should be Counter with value 0',
			build: () => CounterCubit(),
			verify: (cubit) => expect(cubit.state.value, 0),
		);

		blocTest<CounterCubit, Counter>(
			'CounterCubit increment should multiply counter value by 10',
			build: () => CounterCubit(),
			act: (cubit) => cubit.increment(),
			expect: () => [isA<Counter>().having((counter) => counter.value, 'value', 10)],
		);
	});

	group('HomeScreen Widgets', () {
		testWidgets('HomeScreen should display CounterDisplay and IncrementButton', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider(
					create: (context) => CounterCubit(),
					child: MaterialApp(home: HomeScreen()),
				),
			);

			expect(find.byType(CounterDisplay), findsOneWidget);
			expect(find.byType(IncrementButton), findsOneWidget);
		});

		testWidgets('CounterDisplay should initially show 0', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider(
					create: (context) => CounterCubit(),
					child: MaterialApp(home: HomeScreen()),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('IncrementButton should increment counter value by 10', (WidgetTester tester) async {
			await tester.pumpWidget(
				BlocProvider(
					create: (context) => CounterCubit(),
					child: MaterialApp(home: HomeScreen()),
				),
			);

			await tester.tap(find.byType(IncrementButton));
			await tester.pump();

			expect(find.text('10'), findsOneWidget);
		});
	});
}
