import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:webkul_interview/constant.dart';
import 'package:webkul_interview/views/auth/login_Screen.dart';
import 'package:webkul_interview/views/widget/text_input.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
            'Register User',
            style: TextStyle(
              fontSize: 25,
              color: Colors.lightBlue,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                  backgroundColor: Colors.black,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                   onPressed: () => authController.pickImage(),
                    
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: TextInputField(
              controller: _usernameController,
              labelText: 'User Name',
              icon: Icons.person,
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
              onTap: () => authController.registringUser(_usernameController.text, _emailController.text,_passwordContoller.text,authController.profilePhoto ),
              child: Center(
                child: const Text('Register',
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
              const Text('Already have an account ?',
              style: TextStyle(
                fontSize: 20,
              ),
              ),
              InkWell(
                onTap:()=>{
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
  ),
                } ,
                child: Text(' Login',
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
