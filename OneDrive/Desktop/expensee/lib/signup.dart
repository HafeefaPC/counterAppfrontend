import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyForm extends StatelessWidget {
  MyForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
   ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Processing Data')));
    }
  }
  String? _validateEmail( value) {
    if (value!.isEmpty) {
      return 'Please enter your Email';
    }
    RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
  }

  String?_validatePhoneNumber( value) {
    if (value!.isEmpty) {
      return 'Please enter your Phone Number';
    }
   if(value.length != 10){
     return 'Please enter a valid Phone Number';
   }
  }

    String? _validateUsername( value) {
    if (value!.isEmpty) {
      return 'Please enter your Username';
    }
    return null;
  }

      String? _validatePassword( value) {
    if (value!.isEmpty) {
      return 'Please enter your Password';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFF252634),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
                   SizedBox(
                height: 80,
              ),

               SizedBox(
                width:250,
                child: Text("Create new Account",
                textAlign: TextAlign.center,
                style:TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold))),
                 SizedBox(
                height: 50  ,
              ),
              TextFormField(
               
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildinputDecoration("Username", Icons.person,),
                validator: _validateUsername,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                 keyboardType: TextInputType.emailAddress,
                 style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildinputDecoration("Email", Icons.email,),
                        validator: _validateEmail
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                 keyboardType: TextInputType.phone,
                 style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildinputDecoration("Phone Number", Icons.call,),
                        validator: _validatePhoneNumber
              ),
              SizedBox(
                height: 16,
              ),
               TextFormField(
               
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildinputDecoration("Password", Icons.lock,),
                        validator: _validatePassword
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox (
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
  InputDecoration _buildinputDecoration( String labelText, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color(0xAA494A59),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white  )),
        filled: true,
        labelStyle:TextStyle(color: Color(0xFF949494)),
        labelText: labelText,
        suffixIcon: Icon(suffixIcon, color: Color(0xFF949494)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))));
  }
}
