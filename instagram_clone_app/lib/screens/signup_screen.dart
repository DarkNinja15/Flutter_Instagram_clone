import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/widgets/text_field_input.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController bioEditingController = TextEditingController();
  TextEditingController usernameEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    bioEditingController.dispose();
    usernameEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // svg image
                SizedBox(
                  height: size.height * 0.2,
                  child: SvgPicture.network(
                    'https://raw.githubusercontent.com/RivaanRanawat/instagram-flutter-clone/57f92e50238913d1a77b082ea8b061cda74865c9/assets/ic_instagram.svg',
                    color: Colors.white,
                  ),
                ),
                // Circular Avatar
                SizedBox(
                  height: size.height * 0.2,
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1661961110218-35af7210f803?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 25,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_a_photo,
                            // color: Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // text field (username)
                SizedBox(
                  height: size.height * 0.1,
                  child: TextInputField(
                    textEditingController: usernameEditingController,
                    isPass: false,
                    hintText: 'Enter your UserName',
                    textInputType: TextInputType.text,
                  ),
                ),
                // text field (email)
                SizedBox(
                  height: size.height * 0.1,
                  child: TextInputField(
                    textEditingController: emailEditingController,
                    isPass: false,
                    hintText: 'Enter your Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                // text field (password)
                SizedBox(
                  height: size.height * 0.1,
                  child: TextInputField(
                    textEditingController: passwordEditingController,
                    isPass: true,
                    hintText: 'Enter your Password',
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),
                // text field (bio)
                SizedBox(
                  height: size.height * 0.1,
                  child: TextInputField(
                    textEditingController: bioEditingController,
                    isPass: false,
                    hintText: 'Enter your bio',
                    textInputType: TextInputType.text,
                  ),
                ),
                // button login
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Text('SignUp'),
                    width: double.infinity,
                    height: size.height * 0.05,
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
                  ),
                ),
                // Navigate to sign up
                SizedBox(
                  height: size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already Have an account?',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'LogIn',
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
