import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:flutter/cupertino.dart';

class MembershipViewModel extends ChangeNotifier{
  var user = UserPreferences().getUser();
}