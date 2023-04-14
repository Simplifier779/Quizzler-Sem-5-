import 'package:flutter/material.dart';
import './validate_mixin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidateMixin {
  // controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.black,
          width: 3,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.green, width: 3,)
    );
  }

  //key
  final formKey = GlobalKey<FormState>();

  String? email1 = '';
  String? password1 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PSB Quiz'),
      ),
        body: SingleChildScrollView(
            child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(
                  /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/image1.png',width:400,height:240)
                ),
                ColoredBox(
                  color: Color.fromARGB(255, 154, 243, 244),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          child: Text(
                            "It's Quiz Time!!",
                            style: TextStyle(color: Colors.black, fontSize: 40),
                          )),
                      SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                          child: Text(
                            "Come ON!!Let's test ourselves",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Enter Email',
                          hintText: 'Enter your Email Address',
                          border: myinputborder(), //normal border
                          enabledBorder: myinputborder(), //enabled border
                          focusedBorder: myfocusborder()
                        ),
                        validator: validateEmail,
                        onSaved: (String? value) {
                          // print(value);
                          email1 = value;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                          hintText: 'Enter your Password',
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder()
                        ),
                        validator: validatePassword,
                        onSaved: (String? value) {
                          // print(value);
                          password1 = value;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          //TODO FORGOT PASSWORD SCREEN GOES HERE
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            print('email $email1 and password $password1 is recorded');
                            signIn();
                            Navigator.pushNamed(context, "/d");
                          }
                        },
                        child: Text('Submit'),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/");
                            },
                            color: Colors.blue,
                            child: Text('Register'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),
        ),
    );
  }
}