import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin extends StatefulWidget{
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(233, 65, 82, 1),
        title:  Text("Ecommerce Admin panel",style: GoogleFonts.pacifico(fontWeight: FontWeight.bold,fontSize: 30),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Row(
                  children: const [
                     Text('Product',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Icon(Icons.shopping_bag)
                  ],
                ),
                ElevatedButton(onPressed: (){},
                  style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(233, 65, 82, 1))),
                    child: Row(
                      children:  const [
                        Icon(Icons.add),
                        Text("Add Product"),
                      ],
                    ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                const SizedBox(width: 30,),
                SizedBox(
                  width: 200,
                  child: TextFormField(

                    decoration: const InputDecoration(hintText: "search by name",
                    prefixIcon: Icon(Icons.search)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: DropdownButton(items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), onChanged: (_){
    }),
                ) ,
                ElevatedButton(onPressed: (){},
                    child: Row(
                      children: const [
                        Icon(Icons.filter_list),
                        Text("Filter"),
                      ],
                    )
                )
              ],
            ),
            const Image(image: AssetImage("images/internal.jpg"),width: 100,height: 100,)
          ],
        ),
      )
    );
  }
}
