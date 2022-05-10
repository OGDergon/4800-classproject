import 'package:cs4800_classproject/Database/database.dart';
import 'package:cs4800_classproject/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Classes/user.dart';

class ProfileEditMain extends StatefulWidget {
  const ProfileEditMain({Key? key, required this.user}) : super(key: key);
  final int myVar =1;
  final User user;
  @override
  _ProfileEditMainState createState() => _ProfileEditMainState();
}

class _ProfileEditMainState extends State<ProfileEditMain> {
  void _handleSubmitted() {
    User savedUser = User(widget.user.userId, name, gender, address, password, walletAddress,email);
    updateUser(savedUser);
    Navigator.of(context).pop();
  }

  bool onChanged = false;
  late bool _passwordVisible;
  late bool _walletAddressVisible;

  final TextEditingController _nameController = TextEditingController();
  String name = loggedInUser.name;
  final TextEditingController _emailController = TextEditingController();
  String email = loggedInUser.email;
  final TextEditingController _genderController = TextEditingController();
  String gender = loggedInUser.gender;
  final TextEditingController _addressController = TextEditingController();
  String address = loggedInUser.address;
  final TextEditingController _passController = TextEditingController();
  String password = loggedInUser.password;
  final TextEditingController _cryptoWalletController = TextEditingController();
  String walletAddress = loggedInUser.cryptoWalletAddress;

  @override
  void initState() {
    _passwordVisible = false;
    _walletAddressVisible = false;
    _nameController.text = widget.user.name;
    _addressController.text = widget.user.address;
    _emailController.text = widget.user.email;
    _genderController.text = widget.user.gender;
    _passController.text = widget.user.password;
    _cryptoWalletController.text = widget.user.cryptoWalletAddress;
    return super.initState();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    double padding = 16;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
          ),
        ),
        leading: IconButton(onPressed: () {
          if(onChanged == false){
            Navigator.of(context).pop();
          }else{
            showDialog(context: context, builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text('Your information has been modified.'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('Save changes?')
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: (){
                  _handleSubmitted();
                  Navigator.of(context).pop();
                }, child: Text('Save and Continue')),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }, child: Text('Discard Changes')),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('Cancel')),
              ],
            ));
          }

        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
          children: [
            //top navigation: back to dashboard(?), profile header, settings cog
            //text fields
            Expanded(
              flex: 60,
              child: ListView(
                children: [
                  SizedBox(height: 20),

                  // Personal info
                  Padding(padding: sidePadding,
                    child: Text("Personal information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            hintText: 'Edit Name'
                        ),
                        controller: _nameController,
                        onChanged: (String value) {
                          name = value;
                          onChanged=true;
                        },
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Gender',
                            hintText: 'Edit Gender'
                        ),
                        controller: _genderController,
                        onChanged: (String value) {
                          gender = value;
                          onChanged=true;
                        },
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Shipping Address',
                            hintText: 'Edit Shipping Address'
                        ),
                        controller: _addressController,
                        onChanged: (String value) {
                          address = value;
                          onChanged=true;
                        },
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Edit Email'
                        ),
                        controller: _emailController,
                        onChanged: (String value) {
                          email = value;
                          onChanged=true;
                        },
                      )
                  ),
                  Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                    child: TextField(
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Edit Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: (){
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          )
                      ),
                      controller: _passController,
                      onChanged: (String value) {
                        password = value;
                        onChanged=true;
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  // Billing info
                  Padding(padding: sidePadding,
                    child: Text("Billing",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Number',
                            hintText: 'Enter credit card number'
                        ),
                      )
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expiration Date',
                            hintText: 'Enter credit card expiration date'
                        ),
                      )
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CSC',
                            hintText: 'Enter credit card security code'
                        ),
                      )
                  ),
                  SizedBox(height: 20),

                  // Wallet info
                  Padding(padding: sidePadding,
                    child: Text("Crypto Wallet information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                    child: TextField(
                      obscureText: !_walletAddressVisible,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Wallet Address',
                          hintText: 'Edit Wallet Address',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _walletAddressVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: (){
                              setState(() {
                                _walletAddressVisible = !_walletAddressVisible;
                              });
                            },
                          )
                      ),
                      controller: _cryptoWalletController,
                      onChanged: (String value) {
                        walletAddress = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            //save changes button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: (MyApp.themeNotifier.value == ThemeMode.light
                        ? Colors.blue: Colors.amber), borderRadius: BorderRadius.circular(20)
                ),
                child: TextButton(
                  onPressed: () {
                    _handleSubmitted();
                  },
                  child: Text(
                    'Save Changes',
                    style: TextStyle (color: (MyApp.themeNotifier.value == ThemeMode.light
                        ? Colors.white: Colors.black), fontSize: 25),
                  ),
                ),
              ),
            ),
            //bottom navigation: home, create listing, profile
          ]
      ),
    );
  }
}