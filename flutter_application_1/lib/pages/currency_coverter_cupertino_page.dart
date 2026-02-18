import 'package:flutter/cupertino.dart';

class CurrencyCoverterCupertinoPage extends StatefulWidget {
  const CurrencyCoverterCupertinoPage({super.key});

  @override
  State<CurrencyCoverterCupertinoPage> createState() => _CurrencyCoverterCupertinoPageState();
}

class _CurrencyCoverterCupertinoPageState extends State<CurrencyCoverterCupertinoPage> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;
  
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 40, 137, 255),

      // add navbar, outisde of body widget
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey,
        middle: Text(
          "Currency Converter",
          style: TextStyle(
            color: CupertinoColors.white
          ),
          ),         
        // actions
        // leading
      ),

      child: Center(
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
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  color: CupertinoColors.white,
                ), 
                placeholder: "Please enter the amount in USD",
                prefix: const Icon((CupertinoIcons.money_dollar)),
 
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              // add space useing sizebox, instead of container, which is not a const, we use sizebox to ensure only build once
              const SizedBox(height: 10,),

              // Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CupertinoButton (
                  // style: const ButtonStyle(
                  //   elevation: WidgetStatePropertyAll(10),
                  //   backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  //   foregroundColor: WidgetStatePropertyAll(Colors.white),
                  //   minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
                  //   shape: WidgetStatePropertyAll(RoundedRectangleBorder())
                  // ),
                
                  // style: CupertinoButton.styleFrom(
                  // //   elevation: WidgetStatePropertyAll(10),
                  //   backgroundColor: (const Color.fromARGB(255, 19, 63, 99)),
                  //   foregroundColor: (CupertinoColors.white),
                  //   minimumSize: (const Size(double.infinity, 50)),
                  //   shape: (const RoundedRectangleBorder())
                  // ),
                
                  color: const Color.fromARGB(255, 19, 63, 99),
                  borderRadius: BorderRadius.circular(5),
                
                  onPressed: () {
                    // build(context);
                    setState(() {
                      result = double.parse(textEditingController.text) * 1.41;
                    });
                  },
                
                  child: const Text(
                    'Convert',
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                  // child: const Text('Convert'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}