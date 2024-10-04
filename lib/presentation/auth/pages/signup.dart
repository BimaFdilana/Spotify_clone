import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_flutter/common/helpers/is_dark_mode.dart';
import 'package:spotify_flutter/common/widgets/appbar/app_bar.dart';
import 'package:spotify_flutter/common/widgets/button/basic_app_button.dart';
import 'package:spotify_flutter/core/config/assets/app_vectors.dart';
import 'package:spotify_flutter/data/models/auth/create_user_req.dart';
import 'package:spotify_flutter/domain/usecases/auth/signup.dart';
import 'package:spotify_flutter/presentation/auth/pages/signin.dart';
import 'package:spotify_flutter/presentation/root/pages/root.dart';
import 'package:spotify_flutter/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _siginText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 30,
        ),
        child: Column(
          children: [
            _registerText(),
            const SizedBox(height: 30),
            _fullNameField(context),
            const SizedBox(height: 20),
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 25),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SignupUseCase>().call(
                  params: CreateUserReq(
                    fullName: _fullName.text,
                    email: _email.text,
                    password: _password.text,
                  ),
                );
                result.fold(
                  (l) {
                    var snackBar = const SnackBar(content: Text('l'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  (r) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const RootPage(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              title: 'Creat Account',
            ),
            const SizedBox(height: 20),
            _dividerOr(context),
            const SizedBox(height: 15),
            _googleOrApple(context)
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SigninPage(),
                ),
              );
            },
            child: const Text(
              'Sign In',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dividerOr(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey[400],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Or',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Widget _googleOrApple(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          color: Colors.transparent,
          child: SvgPicture.asset(
            AppVectors.google,
            fit: BoxFit.none,
          ),
        ),
        const SizedBox(width: 20),
        Container(
          height: 50,
          width: 50,
          color: Colors.transparent,
          child: SvgPicture.asset(
            context.isDarkMode ? AppVectors.appleLight : AppVectors.appleDark,
            fit: BoxFit.none,
          ),
        ),
      ],
    );
  }
}
