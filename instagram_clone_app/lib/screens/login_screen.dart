import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_app/resources/auth_methods.dart';
import 'package:instagram_clone_app/screens/signup_screen.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/utils/utils.dart';
import 'package:instagram_clone_app/widgets/text_field_input.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_scree_layout.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool _isLoading = false;

  _logInUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().LogInUser(
      email: emailEditingController.text,
      password: passwordEditingController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayOut: WebScreenLayOut(),
            mobileScreenLayOut: MobileScreenLayOut(),
          ),
        ),
      );
    } else {
      snackbar(res, context);
    }
    print(res);
  }

  @override
  void dispose() {
    super.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // svg image
                SizedBox(
                  height: size.height * 0.4,
                  child: SvgPicture.network(
                    'https://raw.githubusercontent.com/RivaanRanawat/instagram-flutter-clone/57f92e50238913d1a77b082ea8b061cda74865c9/assets/ic_instagram.svg',
                    color: Colors.white,
                  ),
                ),
                // text field (email)
                SizedBox(
                  height: size.height * 0.1,
                  child: TextInputField(
                    textEditingController: emailEditingController,
                    isPass: false,
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                // text field (password)
                SizedBox(
                  height: size.height * 0.1,
                  child: TextInputField(
                    textEditingController: passwordEditingController,
                    isPass: true,
                    hintText: 'Password',
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),
                // button login
                InkWell(
                  onTap: _logInUser,
                  child: Container(
                    height: size.height * 0.060,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            4,
                          ),
                        ),
                      ),
                      color: blueColor,
                    ),
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text('LogIn'),
                  ),
                ),
                // Navigate to sign up
                SizedBox(
                  height: size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t Have an account?',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            );
                          },
                          child: const Text(
                            'SignUp',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
