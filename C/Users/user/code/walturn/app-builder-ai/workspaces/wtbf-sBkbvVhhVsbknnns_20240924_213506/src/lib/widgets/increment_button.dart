
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/counter_cubit.dart';

class IncrementButton extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			onPressed: () {
				context.read<CounterCubit>().increment();
			},
			child: Text('Increment'),
		);
	}
}
