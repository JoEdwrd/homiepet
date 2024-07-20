import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    double getDeviceHeight = MediaQuery.of(context).size.height;
    double getDeviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: getDeviceHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.center,
                stops: const [
                  0.0,
                  1,
                  1.0
                ],
                colors: [
                  Colors.orangeAccent,
                  Colors.orange.shade700,
                  Colors.white
                ]),
          ),
          child: Stack(
            children: [
              Center(
                  child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Image.asset('assets/appbarlogo.png',
                              height:
                                  MediaQuery.of(context).size.height * 0.06),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                              height: getDeviceHeight * 0.691,
                              width: 340,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 4,
                                        spreadRadius: 2)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 20),
                                      child: const Text(
                                        "Log In",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Form(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: const Text(
                                              "Email",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 18),
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                      blurRadius: 4,
                                                      spreadRadius: 2)
                                                ]),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    borderSide:
                                                        BorderSide.none),
                                                hintText: "Enter your email",
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: const Text(
                                              "Password",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                      blurRadius: 4,
                                                      spreadRadius: 2)
                                                ]),
                                            child: TextFormField(
                                              obscureText: !_passwordVisible,
                                              decoration: InputDecoration(
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      _passwordVisible
                                                          ? Icons.visibility
                                                          : Icons
                                                              .visibility_off,
                                                    ),
                                                    color: Colors.grey,
                                                    onPressed: () {
                                                      setState(() {
                                                        _passwordVisible =
                                                            !_passwordVisible;
                                                      });
                                                    },
                                                  ),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          borderSide:
                                                              BorderSide.none),
                                                  hintText:
                                                      "Enter your password"),
                                            ),
                                          ),
                                          Container(
                                              alignment: Alignment.topRight,
                                              child: TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Forgot Password?",
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                              )),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 15),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushReplacementNamed(context, '/preference');
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.orange,
                                                  fixedSize: Size(
                                                      getDeviceWidth * 0.55,
                                                      getDeviceHeight * 0.01)),
                                              child: const Text(
                                                "Login",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 15),
                                              child: const Text("OR")),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 20),
                                            child: OutlinedButton.icon(
                                              onPressed: () {
                                                      // Navigator.pop(context);
                                              },
                                              label: const Text(
                                                  "Continue with Google"),
                                              icon: Image.asset(
                                                  'assets/img.png',
                                                  width: getDeviceWidth * 0.07),
                                              style: OutlinedButton.styleFrom(
                                                alignment: Alignment.topLeft,
                                                padding:
                                                    const EdgeInsets.all(12),
                                                fixedSize: Size(
                                                    getDeviceWidth * 0.53,
                                                    getDeviceHeight * 0.06),
                                                foregroundColor: Colors.orange,
                                                side: const BorderSide(
                                                    width: 1.2,
                                                    color: Colors.orange),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 20),
                                            child: OutlinedButton.icon(
                                              onPressed: () {},
                                              label: const Text(
                                                  "Continue with Facebook"),
                                              icon: Image.asset(
                                                  'assets/Facebook_Logo_Primary.png',
                                                  width: getDeviceWidth * 0.07),
                                              style: OutlinedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                fixedSize: Size(
                                                    getDeviceWidth * 0.53,
                                                    getDeviceHeight * 0.06),
                                                foregroundColor: Colors.orange,
                                                side: const BorderSide(
                                                    width: 1.2,
                                                    color: Colors.orange),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                  "Don't have an account?"),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    "Sign up",
                                                    style: TextStyle(
                                                        color: Colors.orange),
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      )))
            ],
          ),
        ),
      )),
    );
  }
}
