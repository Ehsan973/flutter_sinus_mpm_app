import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinus_mpm_application/src/features/profile/bloc/profile_event.dart';
import 'package:sinus_mpm_application/src/features/profile/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
  }
}
