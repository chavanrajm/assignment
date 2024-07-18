import 'package:assignment/src/components/appBar.dart';
import 'package:assignment/src/constants/colors.dart';
import 'package:assignment/src/providers/authProvider.dart';
import 'package:assignment/src/screens/signup/view/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
   Login({super.key});


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: MyAppBar(titleText: 'My News', ),
      resizeToAvoidBottomInset: true,
      body: Form(
        key: provider.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: provider.emailController,
                onTapOutside: (p){
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: provider.passwordController,
                onTapOutside: (p){
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        surfaceTintColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    onPressed: ()async{
                      if (provider.formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Loging in....', ), duration: Duration(seconds: 2),),
                        );
                        await provider.login(context);
                      }
                    },
                    child: Text('Login',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
               SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 30),
                 child: GestureDetector(
                   onTap: (){
                     Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (context) => SignUp()),
                     );
                   },
                   child: RichText(text: TextSpan(
                     children: [
                       TextSpan(text: 'New here?', style: TextStyle(
                         color: Colors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.w500
                       ) ),
                       TextSpan(text: ' Signup', style: TextStyle(
                           color: AppColors.primaryBlue,
                           fontSize: 18,
                           fontWeight: FontWeight.w500
                       ) ),
                     ]
                   )),
                 ),
               ),
                SizedBox(height: 50,),
              ],
            ),
          ],
        ),),
    );
  }
}
