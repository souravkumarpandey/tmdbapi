import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:webkul_interview/constant.dart';
import 'package:webkul_interview/views/auth/signUpScreen.dart';
import 'package:webkul_interview/views/widget/text_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WebKul Movies',
            style: TextStyle(
              fontSize: 35,
              color: Colors.lightBlue,
              fontWeight: FontWeight.w900,
            ),
          ),
           const SizedBox(
            height:15,
          ),
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 25,
              color: Colors.lightBlue,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: TextInputField(
              controller: _emailController,
              labelText: 'Email',
              icon: Icons.email,
            ),
            
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: TextInputField(
              controller: _passwordContoller,
              labelText: 'Password',
              icon: Icons.lock,
              isObscure: true,
               
            ),
          ),
           const SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width-40,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: InkWell(
              onTap:()=> authController.loginUser(_emailController.text, _passwordContoller.text),
              child: Center(
                child: const Text('Login',
                style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.w700,
                  
                ) ,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account ?',
              style: TextStyle(
                fontSize: 20,
              ),
              ),
              InkWell(
                  onTap:()=>{
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUpScreen()),
  ),
                } ,
                child: Text(' Register',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize:20,
                  fontWeight: FontWeight.bold, 
                ),
                ),
              )
              
            ],
          )
        ],
      ),
    ));
  }
}
