import 'dart:convert';

import 'package:api_tutorials/new_password_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class EnterEmail extends StatefulWidget {
  const EnterEmail({super.key});

  @override
  State<EnterEmail> createState() => _EnterEmailState();
}

class _EnterEmailState extends State<EnterEmail> {

  TextEditingController EmailController = TextEditingController();
  bool isDone = false;





  //Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>>
   Future<void> GetOTP() async {
    
    try{
      
      Response response = await post(
        Uri.parse('http://3.109.124.174:1313/api/get-otp/'),

        body : {
          "email" : EmailController.text.toString()

        }
      );

      if(response.statusCode == 200){
        bool isDone = true;
        print('OTP Sent Successfully');
        print(response.statusCode);
        var data = jsonDecode(response.body.toString());
        print(data);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>NewPasswordPage()));
        //return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data), duration: Duration( seconds: 2)));
        //print(response.request);
      }
      else {
        print('OTP not sent');
      }

    }
    catch (error){
      print(error.toString());
    }
    
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height : 109),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width : 100),
                Image.asset('assets/images/Forgot password email reset 1.png'),
              ],
            ),
        
          SizedBox(height : 80),
        
          Row(
            children: [
              SizedBox(width : 26),
              Text('Forget Password', style: TextStyle(
                  fontSize: 20.79,
                  fontWeight: FontWeight.w700,
                fontFamily: 'Schyler',
                color: Color(0xFF374151),
        
        
              ),
              )
            ],
          ),
        
            SizedBox(height : 20),
        
            Row(
              children: [
                SizedBox(width : 24),
                Text(
                  'Enter your registered email below',
                  style: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 16,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.w300,
                    height: 0.08,
                  ),
                ),
              ],
            ),
        
            SizedBox(height : 50),
        
        
            Row(
              children: [
                SizedBox(width : 40),
                Text(
                  'Email address',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.55,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.w600,
                    height: 0.18,
                  ),
                )
              ],
            ),
        
        
            SizedBox(height : 8),
            
            

        
            SizedBox(height : 10),
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
        
                  controller: EmailController,
                      decoration: InputDecoration(
                        //hintText: '  Email'
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
                      ),
              )
            ),
            
            
            
        
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left : 30),
                  child: Text('Remember the password?', style : TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14.55,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  )
                  ),
                ),
        
                TextButton(onPressed: (){},
        
                    child: Text('Sign in',
                style: TextStyle(color: Color(0xFF1AA2B4), fontFamily: 'Schyler',
                fontWeight: FontWeight.w600),
                )
                ),
        
        
        
        
        
              ],
            ),
        
            SizedBox(height: 30,),
        
            ElevatedButton(
        
              style: ElevatedButton.styleFrom(shape: StadiumBorder(),
              backgroundColor: Color(0xFF1EA4B6)
              ),
                onPressed: (){
                //GetOTP(EmailController.text.toString());
                  GetOTP();

                },
                child : Text('         Submit         ', style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white,
                  fontFamily: 'Schyler'
                ),
                )
            )
        
        
        
          ],
        
        
        ),
      ),

    );
  }
}





// Container(
//   width : 300,
//   child: TextField(
//     decoration: InputDecoration(
//       fillColor: Colors.red,
//   focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(40),
//     borderSide: BorderSide(
//       color : Colors.black54
//     )
//       ),
//
//     ),
//   ),
// )

// Padding(
//   padding: const EdgeInsets.only( top : 10),
//   child: Container(
//     height : 50,
//     width: 200,
//     decoration: BoxDecoration(
//       color : Colors.black12,
//       borderRadius: BorderRadius.circular(40)
//     ),
//   ),
// )

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason> ShowSnackBar{
// if(isDone == true) {
// return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP Sent if valid'), duration: Duration( seconds: 3)));
// }
// else {
// return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP not sent, please check the email'), duration: Duration( seconds: 3)));
// }
// }