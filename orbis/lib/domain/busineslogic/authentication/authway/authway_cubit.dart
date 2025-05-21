import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbis/domain/busineslogic/authentication/authway/authway_state.dart';

class AuthwayCubit extends Cubit<AuthwayState> {
  AuthwayCubit() : super(AuthwayState("Email",Icons.alternate_email_outlined));

  changedauthway() {
    emit(AuthbyEmail(state.authway == "Email" ? "Phone" : "Email",
        state.authway == "Email" ? Icons.phone_android : Icons.alternate_email_outlined));
  }
    
  }

