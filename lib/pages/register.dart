import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisiblePassword = false;
  bool _passwordVisibleConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    double getDeviceHeight = MediaQuery.of(context).size.height;
    double getDeviceWidth = MediaQuery.of(context).size.width;

    List<Widget> inputField(String content) {
      return [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            content,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
          height: getDeviceHeight*0.06,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: TextFormField(
            keyboardType: (content == 'Email' ? TextInputType.emailAddress : TextInputType.text),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide.none),
              hintText: "Enter ${content.toLowerCase()}",
            ),
          ),
        )
      ];
    };

    List<Widget> passwordInputField(String content) {

      return [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            content,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
          height: getDeviceHeight*0.06,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: TextFormField(
            obscureText: content == "Password" ? !_passwordVisiblePassword : !_passwordVisibleConfirmPassword,
            decoration: InputDecoration(
                floatingLabelBehavior:
                FloatingLabelBehavior.always,
                suffixIcon: IconButton(
                  icon: Icon(
                    (content == "Password" ? _passwordVisiblePassword : _passwordVisibleConfirmPassword) ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    setState(() {
                      content == "Password" ? _passwordVisiblePassword = !_passwordVisiblePassword : _passwordVisibleConfirmPassword = !_passwordVisibleConfirmPassword;
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
                "Enter ${content.toLowerCase()}"),
          ),
        )
      ];
    };

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Column(
                      children: [
                        SizedBox(height: getDeviceHeight * 0.05),
                        Image.asset('assets/appbarlogo.png',
                            height:
                                MediaQuery.of(context).size.height * 0.06),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                            width: 340,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 0, 0, 20),
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Form(
                                    autovalidateMode: AutovalidateMode.always,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ...inputField("Name"),
                                        ...inputField("Email"),
                                        ...passwordInputField("Password"),
                                        ...passwordInputField("Confirm Password"),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 15, 0, 15),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushReplacementNamed(context, "/login");
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.orange,
                                                fixedSize: Size(
                                                    getDeviceWidth * 0.55,
                                                    getDeviceHeight *
                                                        0.01)),
                                            child: const Text(
                                              "Register",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                                "Already have an account?"),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pushReplacementNamed(context, "/login");
                                                },
                                                child: const Text(
                                                  "Log in",
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
                    ))),
          ),
        ),
      ),
    );
  }
}
