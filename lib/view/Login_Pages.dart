import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginb/view/Call_dia.dart';


class Logins extends StatelessWidget {
  const Logins({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                 Padding(
                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.05,left:MediaQuery.of(context).size.width*0.09),
                   child: Image.asset('images/Loginpages.png',height: 250,),
                 ),

                Padding(
                  padding:  EdgeInsets.only(
                      right:MediaQuery.of(context).size.width*0.6,
                      top: MediaQuery.of(context).size.height*.02),
                  child: Text('Log In', style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 30,right: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email ID',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                          suffixIcon: Icon(Icons.visibility_off)
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.48,top: MediaQuery.of(context).size.height*.01),
                  child: Text('Forget Password ?',style: TextStyle(fontSize: 16,color: Colors.lightBlueAccent),),
                ),
                SizedBox(height: 8,),
                InkWell(
                  onTap: ()=>Get.to(()=>HomeScren()),
                  child: Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                        child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                ),
                SizedBox(height: 1),

                // OR Divider
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width*.01),
                        child: Text('Or'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                
                Image.asset('images/facbook.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Don't have account?"),
                    SizedBox(width: MediaQuery.of(context).size.width*.01,),
                    Text('Sign Up',style: TextStyle(color: Colors.lightBlue),)
                  ],
                )

              ],
            )
        ),
      ),
    );
  }
}
