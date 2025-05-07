import 'package:conversor_de_moedas/api/http_client.dart';
import 'package:conversor_de_moedas/api/widgets/buildtextfield.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double dollar = 0 ;
  double euro = 0 ;
  double yen = 0 ;
  double bitcoin = 0 ; 
  double pesoArgentine = 0 ;

  final TextEditingController realController = TextEditingController();
  final TextEditingController dollarController = TextEditingController();
  final TextEditingController euroController = TextEditingController();
  final TextEditingController yenController = TextEditingController();
  final TextEditingController bitcoinController = TextEditingController();
  final TextEditingController pesoArgentineController = TextEditingController();



  MyHttpClient http =  MyHttpClient();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              scale: 3,
            ),
            const SizedBox(width: 5),
            const Text(
              "CONVER\$SIMPLES",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<Map>(future: http.getData(), builder: (context,snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: const CircularProgressIndicator(color: Colors.green,),);
            default:
              if(snapshot.hasError){
                return Center(child: const Text("ERRO...",style: TextStyle(color: Colors.red),),);
              } else {
                dollar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                yen = snapshot.data!["results"]["currencies"]["JPY"]["buy"];
                pesoArgentine = snapshot.data!["results"]["currencies"]["ARS"]["buy"];
                bitcoin = snapshot.data!["results"]["currencies"]["BTC"]["buy"];
                return SingleChildScrollView(
                  child: 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:  [
                     BuildTextField(labelText: "Reais", prefixText: "R\$",controller: realController,),
                        const Divider(),
                        BuildTextField(labelText: "Dólares", prefixText: "USD",controller: dollarController,),
                        const Divider(),
                        BuildTextField(labelText: "Euros", prefixText: "€",controller: euroController,),
                        const Divider(),
                        BuildTextField(labelText: "Ienes", prefixText: "¥",controller: yenController,),
                        const Divider(),
                        BuildTextField(labelText: "Peso Argentino", prefixText: "ARS",controller: pesoArgentineController,),
                        const Divider(),
                        BuildTextField(labelText: "Bitcoins", prefixText: "BTC",controller: bitcoinController,),
                    ],
                  ),
                ));
              }
        }
      }),
    );
  }
}
