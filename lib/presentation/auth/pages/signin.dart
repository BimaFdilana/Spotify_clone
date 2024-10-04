import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_flutter/common/helpers/is_dark_mode.dart';
import 'package:spotify_flutter/common/widgets/appbar/app_bar.dart';
import 'package:spotify_flutter/common/widgets/button/basic_app_button.dart';
import 'package:spotify_flutter/core/config/assets/app_vectors.dart';
import 'package:spotify_flutter/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
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
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 25),
            BasicAppButton(onPressed: () {}, title: 'Sign In'),
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
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member? ',
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
                  builder: (context) => SignupPage(),
                ),
              );
            },
            child: const Text(
              'Register Now',
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
