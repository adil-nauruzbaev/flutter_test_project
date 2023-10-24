import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core_d_i.dart';
import 'package:flutter_test_project/features/home/data/bloc/user/bloc.dart';
import 'package:flutter_test_project/features/home/data/bloc/user/states.dart';

class TinderBuilder extends StatelessWidget {
  const TinderBuilder({super.key, required this.builder});

  final Widget Function(UsersLoaded data) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      bloc: CoreDi.get(),
      builder: (context, state) {
        return switch (state) {
          (final UsersLoaded state) => builder(state),
          (final UsersLoading _) => const Center(
              child: CircularProgressIndicator(color: Colors.red),
            ),
          (final UsersError _) => const Center(
              child: Text('Что-то пошло не так'),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
