import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'crypto_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'USD';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: pickerItems,
    );
  }

  Map<String,String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency.toString());
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Column makeCards()  {

    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          crypto,
           selectedCurrency.toString(),
           isWaiting ? '?' : coinValues[crypto].toString(),
        ),
      );
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:cryptoCards,

    );
  }
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('📈 Crypto Converter'),
      ),
      body: Column(
        children: <Widget>[
          makeCards(),
          Container(
            height: 50.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.blue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),

        ],
      ),
    );
  }
}
class CryptoCard extends StatelessWidget {
  CryptoCard( @required this.value,@required this.selectedCurrency,@required this.cryptoCurrency);
  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Color(0xFF0A0E21),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 20.0),
          child: Container(
            margin: EdgeInsets.all(15.0),
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF0A0E21),
            ),
            child: Text(
              '1 $value = $cryptoCurrency $selectedCurrency',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),

      ),
    );
  }
}
