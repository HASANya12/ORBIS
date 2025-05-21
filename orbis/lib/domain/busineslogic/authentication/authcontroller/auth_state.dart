// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

// ignore: duplicate_ignore
class AuthState extends Equatable {

  @override
  List<Object?> get props => [];

  get email => null;
}

class AuthInial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String errormassage;
  AuthError(this.errormassage);
  @override
  List<Object?> get props => [];
}

