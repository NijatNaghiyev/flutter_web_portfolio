import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/skills_entity.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_state.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/my_skills/my_skills.dart';

class MySkillsList extends StatelessWidget {
  const MySkillsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MainCubit, MainState, List<SkillsEntity>?>(
      selector: (state) {
        return state.skills;
      },
      builder: (context, state) {
        if (state == null) {
          return const SizedBox.shrink();
        }

        return MySkills(item: state);
      },
    );
  }
}
