import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone_app/resources/auth_methods.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/utils/utils.dart';
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
  Uint8List? image;
  bool _isLoading = false;

  _selectImage() async {
    Uint8List im = await imagepicker(ImageSource.camera);
    setState(() {
      image = im;
    });
  }

  _signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    final res = await AuthMethods().SignUpUser(
      email: emailEditingController.text,
      password: passwordEditingController.text,
      username: usernameEditingController.text,
      bio: bioEditingController.text,
      file: image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      snackbar(res, context);
    }
    print(res);
  }

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
                      image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(image!),
                            )
                          : const CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                              ),
                            ),
                      Positioned(
                        right: 0,
                        bottom: 25,
                        child: IconButton(
                          onPressed: _selectImage,
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
                  onTap: _signUpUser,
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.060,
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
                        : const Text('SignUp'),
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
