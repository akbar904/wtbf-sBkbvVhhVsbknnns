
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/cubits/counter_cubit.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is 0', () {
			expect(counterCubit.state, 0);
		});

		blocTest<CounterCubit, int>(
			'emits [10] when increment is called',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [10],
		);

		blocTest<CounterCubit, int>(
			'emits [10, 20] when increment is called twice',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [10, 20],
		);
	});
}
