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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.center,
                stops: const [0.0, 1, 1.0],
                colors: [
                  Colors.orangeAccent,
                  Colors.orange.shade700,
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: getDeviceHeight * 0.05),
                Center(
                  child: Image.asset(
                    'assets/appbarlogo.png',
                    height: getDeviceHeight * 0.1,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    width: getDeviceWidth * 0.825, // Set the desired width
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 4,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Email",
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: getDeviceHeight*0.06,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Enter your email...",
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              const Text(
                                "Password",
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: getDeviceHeight*0.06,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      color: Colors.grey,
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible =
                                          !_passwordVisible;
                                        });
                                      },
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Enter your password..",
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/preference');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Align(
                                alignment: Alignment.center,
                                child: Text("OR"),
                              ),
                              const SizedBox(height: 15),
                              OutlinedButton.icon(
                                onPressed: () {},
                                label: const Text("Continue with Google"),
                                icon: Image.asset(
                                  'assets/img.png',
                                  width: getDeviceWidth * 0.07,
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: const BorderSide(
                                    width: 1.2,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              OutlinedButton.icon(
                                onPressed: () {},
                                label: const Text("Continue with Facebook"),
                                icon: Image.asset(
                                  'assets/Facebook_Logo_Primary.png',
                                  width: getDeviceWidth * 0.07,
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: const BorderSide(
                                    width: 1.2,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context, "/register");
                                    },
                                    child: const Text(
                                      "Sign up",
                                      style:
                                      TextStyle(color: Colors.orange),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getDeviceHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
