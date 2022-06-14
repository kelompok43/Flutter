import 'package:shared_preferences/shared_preferences.dart';

Future getData()async{
  final sharedPref = await SharedPreferences.getInstance();
  final String? token = sharedPref.getString('token');
  if(token!=null && token.isNotEmpty){
    return token;
  }
  return token;
}