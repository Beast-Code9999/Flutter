import 'package:flutter/material.dart';

  // 1. Create a variable that stores the converted currency value
  // 2. create a funciton that multiplies the value 
  // 3. Store updated value in the variable
  // 4. Display the value

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyCoverterMaterialPage();
  }
}

class _CurrencyCoverterMaterialPage extends State<CurrencyConverterMaterialPage> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // add border
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.circular(50),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 137, 255),

      // add navbar, outisde of body widget
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 137, 255),
        elevation: 0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Times New Roman",
          ),
          ),         
        centerTitle: true,
        // actions
        // leading
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text
              Text(
                'AUD ${result!= 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}', // text = result
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
          
              // Textfield
              // wrap TextField widget with Padding or Container
              TextField(
                controller: textEditingController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(179, 0, 0, 0),
                  ),
                  suffixIcon: const Icon(Icons.monetization_on_outlined),
                  suffixIconColor: const Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              // add space useing sizebox, instead of container, which is not a const, we use sizebox to ensure only build once
              const SizedBox(height: 10,),

              // Button
              ElevatedButton (
                // style: const ButtonStyle(
                //   elevation: WidgetStatePropertyAll(10),
                //   backgroundColor: WidgetStatePropertyAll(Colors.blue),
                //   foregroundColor: WidgetStatePropertyAll(Colors.white),
                //   minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
                //   shape: WidgetStatePropertyAll(RoundedRectangleBorder())
                // ),
              
                style: ElevatedButton.styleFrom(
                //   elevation: WidgetStatePropertyAll(10),
                  backgroundColor: (const Color.fromARGB(255, 19, 63, 99)),
                  foregroundColor: (Colors.white),
                  minimumSize: (const Size(double.infinity, 50)),
                  shape: (const RoundedRectangleBorder())
                ),
                onPressed: () {
                  // build(context);
                  setState(() {
                    result = double.parse(textEditingController.text) * 1.41;
                  });
                },
                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


