import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers to get text from input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // Loading state to show progress indicator
  bool _isLoading = false;

  // Method to handle user login
  Future<void> loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });

      try {
        // Firebase sign in method
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
        
        // If login successful
        if (userCredential.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login successful!'),
              backgroundColor: Colors.green,
            ),
          );
          
          // Navigate to next page (replace with your home page)
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          
        }
      } on FirebaseAuthException catch (e) {
        // Handle specific Firebase errors
        String errorMessage = '';
        
        switch (e.code) {
          case 'user-not-found':
            errorMessage = 'No user found with this email.';
            break;
          case 'wrong-password':
            errorMessage = 'Wrong password provided.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          case 'user-disabled':
            errorMessage = 'This user account has been disabled.';
            break;
          default:
            errorMessage = 'Login failed. Please try again.';
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      } catch (e) {
        // Handle any other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An unexpected error occurred.'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() {
          _isLoading = false; // Hide loading indicator
        });
      }
    }
  }

  @override
  void dispose() {
    // Clean up controllers when widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 100),
              Center(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Enter your credential to login",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _emailController, // Added controller
                  keyboardType: TextInputType.emailAddress, // Show email keyboard
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email), // Changed to email icon
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70),
                    )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Email";
                    }
                    // Basic email validation
                    if (!value.contains('@') || !value.contains('.')) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _passwordController, // Added controller
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock), // Changed to lock icon
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70),
                    )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _isLoading ? null : loginUser, // Disable button when loading
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  fixedSize: Size.fromWidth(130),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: _isLoading 
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text("Login"),
              ),
              SizedBox(height: 20),
              Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to SignUp page
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.pink,
                    ),
                    child: Text("SignUp")
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}