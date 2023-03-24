import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/sample/sample_network_view.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SampleNetworkView();
  }
}
