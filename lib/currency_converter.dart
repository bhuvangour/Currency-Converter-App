import 'package:flutter/material.dart';
class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});
  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}
class _CurrencyConverterState extends State<CurrencyConverter> {
  double resultDollar = 0;
  double resultEuro = 0;
  double resultDhiram = 0;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 3,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.circular(10),
    );
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text(
          'Currency Converter(INR to USD)',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "IN USD: $resultDollar",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                //To dollar
              ),
            ),
            Text(
              "IN EURO: $resultEuro",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                //To dollar
              ),
            ),
                Text(
                  "IN AED: $resultDhiram",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    //To dollar
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in INR',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefix: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.white60,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(),
                maxLength: 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultDollar = (double.tryParse(textEditingController.text)??0)*0.012;
                    resultEuro = (double.tryParse(textEditingController.text)??0)*0.011;
                    resultDhiram = (double.tryParse(textEditingController.text)??0)*0.044;
                  }
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'convert',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
