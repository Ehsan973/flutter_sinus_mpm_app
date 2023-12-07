import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_pool_state.dart';

class CreatePoolCubit extends Cubit<CreatePoolState> {
  CreatePoolCubit() : super(CreatePoolInitial());
}
