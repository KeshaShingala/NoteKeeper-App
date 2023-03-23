import 'package:flutter/material.dart';

import '../../helpers/fire_base_helpers.dart';

class signuppage extends StatefulWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {

  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("B",style: TextStyle(color: Color(0xff795C4B),fontSize: 45,fontWeight: FontWeight.w900)),
                    Text("O",style: TextStyle(color: Color(0xff795C4B),fontSize: 45,fontWeight: FontWeight.w900)),
                    Text("O",style: TextStyle(color: Color(0xffFE9689),fontSize: 45,fontWeight: FontWeight.w900)),
                    Text("K",style: TextStyle(color: Color(0xffFE9689),fontSize: 45,fontWeight: FontWeight.w900)),
                    Text("I",style: TextStyle(color: Color(0xff795C4B),fontSize: 45,fontWeight: FontWeight.w900)),
                  ],
                ),
                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text("Signup",style: TextStyle(color: Color(0xff503A5E),fontSize: 40,fontWeight: FontWeight.w700),),
                ),
                SizedBox(height: 40,),
                Form(
                  key: signupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text("Email",style: TextStyle(color: Color(0xff5F5161),fontSize: 25,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff5F5161),width: 4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter Email First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                email = val!;
                              },
                              controller: emailController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 18),
                                border: InputBorder.none,
                                hoverColor: Colors.blue.shade800,
                                hintText: "Enter Email",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text("Password",style: TextStyle(color: Color(0xff5F5161),fontSize: 25,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff5F5161),width: 4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter Password First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                password = val!;
                              },
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 18),
                                border: InputBorder.none,
                                hoverColor: Colors.blue.shade800,
                                hintText: "Enter Password",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 60,),

                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: InkWell(
                    onTap: () async {
                      if (signupKey.currentState!.validate()) {
                        signupKey.currentState!.save();

                        Map<String, dynamic> data = await FirebaseAuthHelper
                            .firebaseAuthHelper
                            .signUp(email: email, password: password);

                        if (data['user'] != null) {
                          Navigator.of(context).pushReplacementNamed('/',arguments: data['user']);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("signup Successfull...."),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        } else if (data['error'] != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(data['error']),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("signup Failed...."),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                      email = "";
                      password = "";
                      emailController.clear();
                      passwordController.clear();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: double.infinity,
                      color: Color(0xffEE8D6E),
                      child: Text("CREATE ACCOUNT",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 40,
                      color: Color(0xff795C4B),
                    ),
                    SizedBox(width: 10,),
                    Text("OR",style: TextStyle(color: Color(0xff795C4B),fontSize: 20,fontWeight: FontWeight.w500),),
                    SizedBox(width: 10,),
                    Container(
                      height: 1,
                      width: 40,
                      color: Color(0xff795C4B),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async {
                      Map<String,dynamic> data = await FirebaseAuthHelper.firebaseAuthHelper.signinwithGoogle(email: email, password: password);

                      if (data['user'] != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("googleLogin Successfull...."),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        Navigator.of(context).pushReplacementNamed('/' ,arguments:  data['user']);
                      } else if (data['error'] != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(data['error']),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("googleLogin Failled...."),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 80,
                      decoration: BoxDecoration(
                        // color: Colors.grey.shade300,
                        border: Border.all(color: Color(0xff503A5E)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/imgaes/google.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xffFEE5DB),
        ),
    );
  }
}
