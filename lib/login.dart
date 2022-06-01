import 'dart:convert';

import 'package:authh/admin.dart';
import 'package:authh/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey=GlobalKey<FormState>();
  User user=User("", "");
  late bool verify;
  // static const urlPrefix = "http://localhost:8080";

  // Future<void> makePostRequest() async {
  //   final url = Uri.parse('$urlPrefix/posts');
  //   final headers = {"Content-type": "application/json"};
  //   const json = '{"title": "Hello", "body": "body text", "userId": 1}';
  //   final response = await http.post(url, headers: headers, body: json);
  //   print('Status code: ${response.statusCode}');
  //   print('Body: ${response.body}');
  // }
  Future <void> save() async{
    try {
      Uri url = Uri.parse("http://localhost:8080/locationweb/login");
      // final url = Uri.parse(url);
      final map = {
        "email": user.email,
        "password": user.password,
      };
      final body = '{"title": "${user.email}", "body": "${user.password}"}';
      var res = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(map));
      print(res.body);
      if(res.body!=""){
        if (!mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const Admin()),
        );
      }

    }
    catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Form(
            key: _formKey,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  child:  Center(child: Text("Welcome to Login",style: GoogleFonts.pacifico(fontWeight: FontWeight.bold,fontSize: 50,color: const Color.fromRGBO(233, 65, 82, 1)),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        decoration: const BoxDecoration(color: Color.fromRGBO(233, 65, 82, 1),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(80),
                              topRight: Radius.circular(20),topLeft: Radius.circular(80)),
                        ),
                        child: SizedBox(
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text("Login",style: GoogleFonts.pacifico(fontWeight: FontWeight.bold,fontSize: 50),),

                              Padding(
                                padding: const EdgeInsets.only(left: 50,top: 50,right: 100),
                                child: TextFormField(decoration: InputDecoration(labelText: "Email",labelStyle: const TextStyle(color: Colors.black),
                                  focusedBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                  cursorColor: Colors.white,
                                  controller: TextEditingController(text: user.email),
                                  onChanged: (val){
                                    user.email=val;

                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Email is empty";
                                    }
                                    return " ";
                                  },
                                  style: const TextStyle(fontWeight: FontWeight.bold,),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50,bottom: 30,right: 100,top: 10),
                                child: TextFormField(decoration: InputDecoration(labelText: "Password",labelStyle: const TextStyle(color: Colors.black),
                                  focusedBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),),

                                  cursorColor: Colors.white,
                                  controller: TextEditingController(text: user.password),
                                  onChanged: (val){
                                    user.password=val;

                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "password is empty";
                                    }
                                    return " ";
                                  },
                                  style: const TextStyle(fontWeight: FontWeight.bold,),),
                              ),
                              const Text("Don't have an account?")
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: FloatingActionButton(onPressed: ()   {
                            save();

                          // makePostRequest();

                        },
                          backgroundColor:const Color.fromRGBO(233, 65, 82, 1),
                          child: const Icon(Icons.arrow_forward_sharp),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}


