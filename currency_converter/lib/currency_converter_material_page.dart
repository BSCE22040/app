
import 'package:flutter/material.dart';
class CurrencyConverterMaterialPage extends StatefulWidget
{
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() =>_CurrencyConverterMaterialPageState();

}
class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage>
{
  double result=0;
  final TextEditingController textEditingController=TextEditingController();
  
  @override
  Widget build(BuildContext context)
  {
    print("Rebuilt");
    
    
    
    final border=OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2.0,
                style: BorderStyle.solid,
                ),
            borderRadius: BorderRadius.circular(5),
            );
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar:AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        title: const Text("Dollars to PKR Converter",
        style: TextStyle(
          color: Colors.white,
        ),),
        centerTitle: true,

      ),
      body:  Center( child : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text(  'PKR $result',style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255,255, 255, 255)
          ),),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: textEditingController,
            style:  TextStyle(
              color:Colors.black,
            ), 
            decoration: InputDecoration(
              hintText: "Please Enter The Amount In Dollars ",
              hintStyle:  TextStyle( color: Colors.black),
              prefixIcon:  Icon(Icons.monetization_on_outlined,
              ),
              prefixIconColor: Colors.black,
              filled: true,
              fillColor: Colors.white,
              focusedBorder: border,
              enabledBorder: border,
            ),
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            ), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(onPressed: (){

              
              setState(() {
                result=double.parse(textEditingController.text)*279;
              });
              }, 
            style: ButtonStyle(
              elevation: WidgetStatePropertyAll(15),
              backgroundColor: WidgetStatePropertyAll(Colors.black),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              fixedSize: WidgetStatePropertyAll(Size(300, 50)
              ),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              )
              )
            
             
            ),
            child:const Text("Convert"),
            ),
          )

        ],

      ), 
      ) 
    );
  }
}

