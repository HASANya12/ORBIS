import 'package:flutter/material.dart';

class AuthwayState {
  String authway;
   IconData icone;
  AuthwayState(this.authway,this.icone);
}

class AuthbyEmail extends AuthwayState {
  AuthbyEmail(super.authway, super.icone);
  
}

class Authbyphone extends AuthwayState {
  Authbyphone(super.authway, super.icone);
  
}