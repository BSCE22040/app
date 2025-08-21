import 'package:flutter/cupertino.dart';

class CurrencyConverterCopertinoPage extends StatefulWidget {
  const CurrencyConverterCopertinoPage({super.key});

  @override
  State<CurrencyConverterCopertinoPage> createState() =>
      _CurrencyConverterCopertinoPageState();
}

class _CurrencyConverterCopertinoPageState
    extends State<CurrencyConverterCopertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeGreen,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeGreen,
        middle: const Text(
          "Dollars to PKR Converter",
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PKR ${result.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoTextField(
                controller: textEditingController,
                placeholder: "Enter Amount in Dollars",
                placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: CupertinoColors.systemGrey3,
                    width: 1.0,
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoButton(
                color: CupertinoColors.black,
                borderRadius: BorderRadius.circular(10),
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 279;
                  });
                },
                child: const Text(
                  "Convert",
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
