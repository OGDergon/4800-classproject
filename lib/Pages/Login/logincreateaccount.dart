import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  String buttonText = 'Create Account';
  Color buttonColor = Colors.white;

  String userName1 = '';
  String userName2 = '';

  String password1 = '';
  String password2 = '';


  TextButton confirmButton(String name1, String name2, String pass1, String pass2)
  {
    print(name1);
    print(name2);
    print(pass1);
    print(pass2);
    return TextButton(
      onPressed: () {
        if ((name1 == name2) && (pass1 == pass2)) {
          //push to page stack
          // print('accepted');
          // print(name1);
          // print(name2);
          // print(pass1);
          // print(pass2);
        }
        else if ((name1 != name2) && (pass1 == pass2)) {
          setState(() {
            buttonText = 'Email Mismatch';
          });
          print('first else');
        }
        else {
          setState(() {
            buttonText = 'Password Mismatch';
          });
          print('last else');
        }
      },
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10.0, bottom: 0),
                child: Center(
                    child: Container(
                      child: Text('Create Your Account',
                        style: TextStyle(
                          fontSize: 25
                        ),
                      ),
                      padding: EdgeInsets.all(60.0),
                    )
                ),),
              Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
                  child: TextField(
                    onChanged: (String text) {
                        userName1 = text;
                        print(userName1);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    onChanged: (String text) {
                      userName2 = text;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Email',
                        hintText: 'Re-enter valid email id as abc@gmail.com'
                    ),
                  )
              ),
              Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 15,bottom: 0),
                child: TextField(
                  onChanged: (String text) {
                    password1 = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 15,bottom: 10),
                child: TextField(
                  onChanged: (String text) {
                    password2 = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Your Password'),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)
                ),
                child: confirmButton(userName1, userName2, password1, password2)
              ),
              SizedBox(
                height: 130,
              ),
            ],
          ),
        )
    );
  }
}


