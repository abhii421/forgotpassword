import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {

  TextEditingController OTPController = TextEditingController();
  TextEditingController NewPasswordController = TextEditingController();
  TextEditingController EmailController = TextEditingController();

  Future <void> ResetPassword() async {

    try{
      Response response1 = await post(
          Uri.parse('http://3.109.124.174:1313/api/reset-password/'),

    body : {
        "email" : EmailController.text.toString(),
      "otp" : OTPController.text.toString(),
      "new_password" : NewPasswordController.text.toString()
  }
  );

      if(response1.statusCode == 200){
        //bool isVerified = true;
        print('Password Changed Successfully');
        print(response1.statusCode);
        var data1 = jsonDecode(response1.body.toString());
        print(data1);


        //print(response.request);
      }
      else {
        print('OTP not sent');
      }


  }
  catch(error){
      print(error.toString());
  }


}













  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height : 50),
            Padding(
              padding: const EdgeInsets.only(left : 1, top : 50),
              child: Image.asset('assets/images/Forgot password-1 1.png'),
            ),
        
            SizedBox(height : 21),
        
            Row(
              children: [
                SizedBox(width : 15),
                Text('Change Password via OTP', style : TextStyle(
                  fontFamily: 'Schyler',
                  color: Color(0xFF374151),
                  fontSize: 20,
                  fontWeight: FontWeight.w700
        
                ),
                ),
              ],
            ),
        
            SizedBox(height : 10),
        
        
            Text('Enter a different password with the previous',
            style: TextStyle(
              color: Color(0xFF828282),
            fontSize: 14.55,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
            )
            ),
        
        
            SizedBox(height : 30),

            Row(
              children: [
                SizedBox(width : 35),
                Text(
                  'Email ',
                  style: TextStyle(
                    color: Color(0xFF484848),
                    fontSize: 12,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.w600,
                    height: 0.18,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15,),
            Container(
                width: 320,
                height: 45,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child : TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: EmailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    //focusColor: Colors.blue,

                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                  ),
                )
            ),
        
        
        
        
        
        
        
        
            SizedBox(height : 15),


            Row(
              children: [
                SizedBox(width : 35),
                Text(
                  'OTP',
                  style: TextStyle(
                    color: Color(0xFF484848),
                    fontSize: 12,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.w600,
                    height: 0.18,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),


            Container(
                width: 320,
                height: 45,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child : TextFormField(
                  keyboardType: TextInputType.number,
                  controller: OTPController,
                  obscureText: true,
                  decoration: InputDecoration(
                    //focusColor: Colors.blue,
                    //hintText: '  Email'
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                  ),
                )
            ),





            SizedBox(height : 15),


            Row(
              children: [
                SizedBox(width : 35),
                Text(
                  'New Password',
                  style: TextStyle(
                    color: Color(0xFF484848),
                    fontSize: 12,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.w600,
                    height: 0.18,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15,),


            Container(
                width: 320,
                height: 45,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child : TextFormField(
                  keyboardType: TextInputType.number,
                  controller: OTPController,
                  obscureText: true,
                  decoration: InputDecoration(
                    //focusColor: Colors.blue,
                    //hintText: '  Email'
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                  ),
                )
            ),


            SizedBox(height : 30),



            InkWell(
              onTap: (){
                ResetPassword();
              },
              child: Container(
                width: 266.09,
                height: 55.26,
                padding: const EdgeInsets.symmetric(horizontal: 66.52, vertical: 16.63),
                decoration: ShapeDecoration(
                  color: Color(0xFF1EA4B6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(71),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Reset Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.55,
                        fontFamily: 'Schyler',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            )
        
        
        
          ],
        ),
      )
    );
  }
}
