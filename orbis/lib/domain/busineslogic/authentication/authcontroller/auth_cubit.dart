
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbis/domain/busineslogic/authentication/authcontroller/auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confiermpassword = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController location = TextEditingController();
  AuthCubit() : super(AuthInial());

  Future<void> singin(String email, String password) async {
    //   emit(AuthLoading());
    try {
      
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(AuthError(e.toString()));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(AuthError(e.toString()));
      }
    }
  }

  Future singup(String email, String password) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(AuthError(e.toString()));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(AuthError(e.toString()));
    }
  }

  ///////////////////////////////////////////////////////////////////////email
  Future resetpassword(String email) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(AuthError(e.toString()));
    }
  }

  ////////////////////////////////////////////////////////////
  Future verifyPasswordResetCode(String email) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.verifyPasswordResetCode(email);

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(AuthError(e.toString()));
    }
  }

  /////////////////////////////////////////////////////////////
  Future verifyPhoneNumber(String phone) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-resolution of verification code
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(AuthError(e.toString()));
        },
        codeSent: (String verificationId, int? resendToken) {
          // Update the UI to ask the user for the SMS code
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(AuthError(e.toString()));
    }
  }
  ////////////////////////////////////////////////////////
}
