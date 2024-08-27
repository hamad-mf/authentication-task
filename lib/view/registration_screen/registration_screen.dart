import 'package:auth_task/main.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Todo : write code  create controllers and form keys

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cnfmpassController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Sign Up for Free",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: "Your Eamil Address",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff1a75d2),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade400,
                        )),
                  ),
                  validator: (value) {
                    String pattern =
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
                    if (value != null && RegExp(pattern).hasMatch(value)) {
                      return null;
                    } else {
                      return "Enter a valid email";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      hintText: "Your Password",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff1a75d2),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                          )),
                      suffixIcon: Icon(
                        Icons.visibility_off_rounded,
                        color: Colors.grey,
                      )),
                  validator: (value) {
                    String passPattern =
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$';
                    if (value != null && RegExp(passPattern).hasMatch(value)) {
                      return null;
                    } else {
                      return "Enter a valid pass";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: cnfmpassController,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      hintText: "Confirm Your Password",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff1a75d2),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                          )),
                      suffixIcon: Icon(
                        Icons.visibility_off_rounded,
                        color: Colors.grey,
                      )),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter a password";
                    } else if (passController.text == cnfmpassController.text) {
                      return null;
                    } else {
                      return "Password did'nt match";
                    }
                  },
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      SavedEmail = emailController.text;
                      SavedPass = passController.text;

                      Navigator.pop(context);
                    } else {
                      print("registration failed");
                    }
                    // Todo : write code  to navigate to login screen on successful registration
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff1a75d2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color(0xff1a75d2),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
