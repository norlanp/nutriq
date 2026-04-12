part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends ProfileEvent {
  LoadProfileEvent();
}

class ChangeTDEEMethodEvent extends ProfileEvent {
  final TDEEMethodEntity method;

  ChangeTDEEMethodEvent(this.method);

  @override
  List<Object?> get props => [method];
}
