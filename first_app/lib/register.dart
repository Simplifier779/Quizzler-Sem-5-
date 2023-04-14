import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './validate_mixin.dart';
import './login_screen.dart';
import './main.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<MyRegister> with ValidateMixin {
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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email = '', pass = '';
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
                    TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                          labelText: 'Enter Email',
                          hintText: 'Enter your Email Address',
                          border: myinputborder(), //normal border
                          enabledBorder: myinputborder(), //enabled border
                          focusedBorder: myfocusborder()
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) {
                        pass = value;
                      },
                      obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Enter Password',
                            hintText: 'Enter your Password',
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder()
                        ),
                    ),
                    SizedBox(height:20),
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email,
                              password: pass,
                            );
                            Navigator.pushNamed(context, '/first');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print('The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text('Register')),
                    SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/first");
                          },
                          color: Colors.blue,
                          child: Text('login'),
                        ),
                      ],
                    ),
                    SizedBox(height:25),
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