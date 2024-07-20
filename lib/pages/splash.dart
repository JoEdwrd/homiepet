import 'package:flutter/material.dart';
class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[400],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/appbarlogo.png',
                fit: BoxFit.contain,
                height: 50,)
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 1],
              colors: [
                Colors.orange.shade400,
                Colors.brown.shade600
              ],
            ),
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              Center(child: Text("Change a life, adopt a friend.",style:
              TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),)),
              SizedBox(height: 20,),
              Center(child: Text("Find your perfect match! Browse adoptable pets near",style:
              TextStyle(
                  fontSize: 12
              ))),
              Center(child: Text("you and find your new best friend.",style: TextStyle(
                  fontSize: 12
              ),
              )
              ),
              Center(child: Image.asset('assets/splashscreenimage.png',fit: BoxFit.contain, height: 400,)),
              SizedBox(height: 30),
              Center(
                child: Container(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.orange[400]),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.orange.shade400, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
