
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/models/counter_model.dart';

void main() {
	group('Counter Model Tests', () {
		test('Counter model should initialize with default value', () {
			final counter = Counter();
			expect(counter.value, 0);
		});

		test('Counter model should initialize with given value', () {
			final counter = Counter(value: 5);
			expect(counter.value, 5);
		});

		test('Counter model should serialize to JSON', () {
			final counter = Counter(value: 10);
			final json = counter.toJson();
			expect(json, {'value': 10});
		});

		test('Counter model should deserialize from JSON', () {
			final json = {'value': 20};
			final counter = Counter.fromJson(json);
			expect(counter.value, 20);
		});
	});
}
