
import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
	final int counterValue;

	const CounterDisplay({Key? key, required this.counterValue}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Text(
				'$counterValue',
				style: Theme.of(context).textTheme.headline4,
			),
		);
	}
}
