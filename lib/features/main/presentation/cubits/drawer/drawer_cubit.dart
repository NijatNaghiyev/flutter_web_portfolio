import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DrawerCubit extends Cubit<bool> {
  DrawerCubit() : super(false);

  void toggle() => emit(!state);
}
