import 'package:flutter/material.dart';
import '../../application/sample/sample_cubit.dart';
import '../../application/sample/sample_state.dart';

import '../_core/base_view.dart';

class SampleNetworkView extends StatelessWidget {
  const SampleNetworkView({super.key});

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
            title: const Text('Sample Network View'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.isLoading) const CircularProgressIndicator(),
                Text(
                  state.post?.title ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  state.post?.body ?? '',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
