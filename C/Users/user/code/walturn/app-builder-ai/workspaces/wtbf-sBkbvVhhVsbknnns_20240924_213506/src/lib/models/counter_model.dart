
import 'dart:convert';

class Counter {
	int value;

	Counter({this.value = 0});

	Map<String, dynamic> toJson() {
		return {'value': value};
	}

	factory Counter.fromJson(Map<String, dynamic> json) {
		return Counter(value: json['value']);
	}
}
