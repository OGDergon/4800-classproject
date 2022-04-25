import 'package:flutter/material.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 60.0, bottom: 30),
          child: Center(
            child: Container(
              width:200,
              height: 150,
              child: Image.asset('assets/images/amoogus.jpg')
            )
          ),),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter valid email id as abc@gmail.com'
              ),
            )
          ),
         const Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 15,bottom: 0),
          child: TextField(

            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter secure password'),
            ),
          ),
          TextButton(onPressed: (){}, child: const Text(
            'Forgot Password',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)
            ),
            child: TextButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()))
              },
              child: const Text(
                'Login',
                style: TextStyle (color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          const Text('New User? Create Account')
        ],
      ),
    )
    );
  }
}


