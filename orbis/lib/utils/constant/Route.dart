import 'package:orbis/presentation/screens/appscreens/Favorite_screen.dart';
import 'package:orbis/presentation/screens/appscreens/Location_screen.dart';
import 'package:orbis/presentation/screens/appscreens/Profile_screen.dart';
import 'package:orbis/presentation/screens/appscreens/mainscreen.dart';

Map<String, Widget Function(BuildContext)> routes = {


  ////authentication screens
  "/singinScreen":(context)=> SinginScreen(),
  "/singupScreen":(context)=> SinupScreen(),
  "/VerificationScreen":(context)=> VerificationScreen(),
  "/Phoneoremail":(context)=> Phoneoremail(),
  "/Resetpassword":(context)=> Resetpassword(),
  "/LoctionScreen":(contxt)=>LoctionScreen(),
  "/MapScreen":(context)=>Chooselocation(),
    "/Todolist":(context)=>Todolist(),
  ////drwer screens
  "/Offers" :(context)=>Offers(),
  "/Rateus":(context)=> Rateus(),
  "/Support":(context)=>Support(),
  "/home":(context)=> HomeScreen(),


  ////////////////////
  "/Mainscreen":(context)=>Mainscreen(),
  "/LocationScreen":(context)=>LocationScreen(),
  "/FavoriteScreen":(context)=>FavoriteScreen(),
  "/BookingScreen":(context)=>BookingScreen(),
  "/ProfileScreen":(context)=>ProfileScreen(),

  ///////////////////////////
  // "/Holttel":(context)=>Holttel(),
};
