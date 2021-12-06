import 'package:flutter/material.dart';
import 'package:ymkresim/yemekler.dart';

class DetaySayfasi extends StatefulWidget {
  Yemekler yemek;


  DetaySayfasi({required this.yemek});



  @override
  _DetaySayfasiState createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.yemek.Yemek_adi),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.yemek.Yemek_resim_adi}"),
            Text("${widget.yemek.yemek_fiyati}\u{20BA}",style: TextStyle(fontSize: 15,color: Colors.blue),),
            SizedBox(width: 200,height: 50,
              child: ElevatedButton(onPressed: (){
                print("${widget.yemek.Yemek_adi} Verildi");
              }, child: Text("Sipariş ver")),
            )

          ],
        ),
      ),
    );
  }
}
