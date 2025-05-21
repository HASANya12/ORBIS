import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbis/domain/busineslogic/authentication/passworsshow/passwordshow_state.dart';


class PasswordshowCubit extends Cubit<PasswordshowState> {
  PasswordshowCubit()
    : super(PasswordshowState(true, true, Icons.visibility, Icons.visibility));

  Showpassword() {
    emit(
      showpasswordstate(
        !state.showpassword,
        state.showconfpassword,
        state.showpassword ? Icons.visibility_off : Icons.visibility,
        state.showconfpassword  ? Icons.visibility : Icons.visibility_off,
      ),
    );
  }

  Showconfpassword() {
    emit(
      showpasswordstate(
        state.showpassword,
        !state.showconfpassword,
        state.showpassword ? Icons.visibility : Icons.visibility_off,
        state.showconfpassword ? Icons.visibility_off : Icons.visibility,
      ),
    );
  }
}

