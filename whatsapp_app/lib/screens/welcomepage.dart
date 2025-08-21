import 'package:flutter/material.dart';
import 'contactdetail.dart';
class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.language),
                SizedBox(width: 5,),
                Text("English"),
              ],
            ),
          ),
          
          SizedBox(height: 40),
          Center(
            child: Image.asset(
              "assets/welcome_background_image.png",
              width: 250,
              height: 250,
            ),
          ),
           SizedBox(height: 20),
          Text("Welcome to WhatsApp",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("By signing up, you agree to our Privacy Policy and Terms of Service"),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("We use your information to create your account , deliver our services and help keep Whatsapp safe and secure.In Settings you can access,manage and delete your account information."),
            ),
            SizedBox(height: 8),
           ElevatedButton.icon(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Contactdetail()));
           }, label: Text("Agree and Continue" ,style: TextStyle(color: Colors.green),
           ),
           ),
        ],
      ),
    );
  }
}