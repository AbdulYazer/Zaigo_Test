import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaigo_test/core/constants.dart';
import 'package:zaigo_test/presentation/home_screen/home_screen.dart';

import '../../application/login/login_bloc.dart';

String error = '';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  String phoneNumber = '';

  String password = '';

  bool login = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.isError) {
        return const ErrorWidget();
      }
       else if (state.isSuccess) {
        return const SuccessWidget();
      }

      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Please Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Welcome back, you’ve been missed!',
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    UserNameFormField(
                      text: 'Phone Number',
                      icon: const Icon(
                        Icons.person_outlined,
                        color: Colors.black,
                      ),
                      keyboardTextType: TextInputType.phone,
                      onchanged: (value) => phoneNumber = value,
                      validator: (value) {
                        return (value!.length < 10 || value.length > 10)
                            ? 'Enter valid phone number'
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    passwordFormField(),
                    const SizedBox(
                      height: 150,
                    ),
                    Column(
                      children: [
                        Center(
                            child: TextIconButton(
                          text: 'LOG IN',
                          icon: Icons.login,
                          color: mainClr,
                          ontap: () async {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginBloc>(context).add(Login(
                                  phoneNumber: phoneNumber,
                                  password: password));
                              if (state.isSuccess) {
                                Future.delayed(Duration(seconds: 1)).then((value) => Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                    (route) => false));
                              }
                            }
                          },
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  dynamic passwordFormField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          //  controller: _userPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              floatingLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 128, 127, 127)),
              labelText: 'Password'),
          onChanged: (value) => password = value,
          validator: ((value) {
            return value!.trim().length < 8
                ? 'Enter a password 8+ chars long'
                : null;
          }),
        );
      },
    );
  }
}

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/login_successful.png'),
          ),
          const SizedBox(height: 30,),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
               style: ElevatedButton.styleFrom(backgroundColor: mainClr),
                child: const Text('Continue',style: TextStyle(color: Colors.black),),
              
            ),
          )
        ],
      ),
    );
  }
}


class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/login_failed.png'),
          ),
          const SizedBox(height: 30,),
          Container(
            decoration: BoxDecoration(color: mainClr,borderRadius: BorderRadius.circular(5)),
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(const Retry());
              },
              style: ElevatedButton.styleFrom(backgroundColor: mainClr),
              child: const Text('Retry',style: TextStyle(color: Colors.black),),
            ),
          )
        ],
      ),
    );
  }
}

class UserNameFormField extends StatelessWidget {
  UserNameFormField({
    Key? key,
    required this.text,
    this.icon,
    this.keyboardTextType,
    this.onchanged,
    this.validator,
  }) : super(key: key);
  final String text;
  final Widget? icon;
  final TextInputType? keyboardTextType;
  Function(String)? onchanged;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      keyboardType: keyboardTextType,
      maxLines: 1,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        prefixIcon: icon,
        labelText: text,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 128, 127, 127)),
        floatingLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
      ),
      validator: validator,
    );
  }
}

class TextIconButton extends StatelessWidget {
  const TextIconButton(
      {Key? key,
      required this.text,
      this.icon,
      required this.color,
      this.preIcon,
      required this.ontap})
      : super(key: key);
  final Widget? preIcon;
  final String text;
  final IconData? icon;
  final Color color;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 300,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: InkWell(
            onTap: ontap,
            //(() {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ontap));
            // }),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: preIcon,
                ),
                Center(
                    child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                )),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(icon),
                )
              ],
            ),
          ),
        ));
  }
}
