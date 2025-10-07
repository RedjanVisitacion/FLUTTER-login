import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/home/login_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final Map<String, String> userDatabase;

  LoginScreen({super.key, required this.userDatabase});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Center(child: Icon(Icons.lock,size: 80,color: Colors.teal,)),

                Center(child: Text('Welcome Back!')),
                SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
        
                    if (userDatabase.containsKey(email) && userDatabase[email] == password) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid password or not registered')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Center(child: Text('LOGIN',  style: TextStyle(fontSize: 18, color: Colors.teal),)),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SigupScreen(userDatabase: userDatabase)),
                    );
                  },
                  child: Center(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



