import 'package:flutter/material.dart';
import '../../application/sample/sample_cubit.dart';
import '../../application/sample/sample_state.dart';

import '../_core/base_view.dart';

class SampleView extends StatelessWidget {
  const SampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SampleCubit, SampleState>(
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.getSample();
      },
      builder: (context, SampleCubit cubit, SampleState state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sample View'),
          ),
          body: Center(
            child: Text(state.token),
          ),
        );
      },
    );
  }
}
