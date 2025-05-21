import 'package:flutter/widgets.dart';

class PasswordshowState {
  final bool showpassword;
  final bool showconfpassword;
  IconData passwordshowicone;
  IconData confpasswordshowicone;
  PasswordshowState(this.showpassword,this.showconfpassword, this.passwordshowicone,this.confpasswordshowicone);
}

class showpasswordstate extends PasswordshowState {
  showpasswordstate(super.showpassword,super.showconfpassword , super.passwordshowicone,super.confpasswordshowicone);
}


