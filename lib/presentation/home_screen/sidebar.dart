import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigo_test/application/images/images_bloc.dart';
import 'package:zaigo_test/presentation/home_screen/images.dart';
import 'package:zaigo_test/presentation/home_screen/maps_screen.dart';
import 'package:zaigo_test/presentation/login_screen/login_screen.dart';

import '../../application/login/login_bloc.dart';

class SideBar extends StatelessWidget {
  SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    });
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * .65,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              builderHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget builderHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child:Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset('assets/images/UserImage.png'),
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'ID : UID',
                    style: TextStyle(color: Colors.black,overflow: TextOverflow.fade),
                  ),
                ],
              ));
        
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.login_outlined),
            onTap: () async {
              showAlertDialog1(context);
            },
          ),
          ListTile(
            title: const Text('Images'),
            leading: const Icon(Icons.image),
            onTap: () async {
              BlocProvider.of<ImagesBloc>(context).add(const FetchImages());
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageCapture()));
            },
          ),
          ListTile(
            title: const Text('Map'),
            leading: const Icon(Icons.map),
            onTap: () async {
              
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchLocationScreen()));
            },
          ),
        ])
      ],
    );
  }

  showAlertDialog1(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("ok"),
      onPressed: () async {
        BlocProvider.of<LoginBloc>(context).add(const Retry());
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', '').then((value) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Log Out Successfull',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.black,
          ));
        });
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
