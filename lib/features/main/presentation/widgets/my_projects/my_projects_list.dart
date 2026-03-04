import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/projects_entity.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_state.dart';

class MyProjectsList extends StatelessWidget {
  const MyProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MainCubit, MainState, List<ProjectsEntity>?>(
      selector: (state) {
        return state.projects;
      },
      builder: (context, state) {
        if (state == null) {
          return const SizedBox.shrink();
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 16,
            children: state
                .map(
                  (e) => _MyProjectItem(item: e),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _MyProjectItem extends StatelessWidget {
  const _MyProjectItem({required this.item});

  final ProjectsEntity item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 450,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Colors.white,
              image: item.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(item.imageUrl!),
                      fit: BoxFit.fitWidth,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
