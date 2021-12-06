import 'package:flutter/material.dart';
import 'package:ymkresim/detaysayfasi.dart';
import 'package:ymkresim/yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Yemekler>> yemekleriGetir() async {
    var yemeklistesi=<Yemekler>[];
    var y1= Yemekler(1, "Köfte", "kofte.png", 15.99);
    var y2= Yemekler(1, "Makarna","makarna.png", 10.99);
    var y3= Yemekler(1, "Kadayıf", "kadayif.png", 8.99);
    var y4= Yemekler(1, "Fanta", "fanta.png", 5.99);
    var y5= Yemekler(1, "Ayran", "ayran.png", 2.99);
    var y6= Yemekler(1, "Baklava", "baklava.png", 7.99);
    yemeklistesi.add(y1);
    yemeklistesi.add(y2);
    yemeklistesi.add(y3);
    yemeklistesi.add(y4);
    yemeklistesi.add(y5);
    yemeklistesi.add(y6);
    return yemeklistesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yemeklistesi=snapshot.data;
            return ListView.builder(
              itemCount: yemeklistesi!.length,
              itemBuilder: (context,indeks){
                var yemek =yemeklistesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfasi(yemek: yemek) ,),);
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width:150,height: 150,child: Image.asset("resimler/${yemek.Yemek_resim_adi}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(yemek.Yemek_adi,style: TextStyle(fontSize: 15),),
                            SizedBox(
                              height: 50,
                            ),
                            Text("${yemek.yemek_fiyati} \u{20BA}",style: TextStyle(fontSize: 15,color: Colors.blue),),
                          ],

                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                );
              },

            );
          }else {
            return Center();
          }
        },

      ),
    );
  }
}