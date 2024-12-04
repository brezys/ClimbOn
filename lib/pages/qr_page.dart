import 'package:climbon/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCreate extends StatelessWidget{
  const QRCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => LoginOrRegister.new,
          
        ),
      ),
      body: 
      
      Stack(
        children: <Widget>[
        Center(

          child: ElevatedButton(onPressed: () {
          _showQRModal(context, '123', 'rock.webp'); //123 is the unique id
      },
        autofocus: true, 
        child: const Text('Generate QR Code'),
        ),
    
        )
      ],)
      
      
      
      
    );

    
  }
}

void _showQRModal(BuildContext context, String climbID, String imagePath){
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 250,
        padding: const EdgeInsets.all(16),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.close))
            ],
          ),

          SizedBox(
            width: 200,
            height: 200,
            child: 
              QrImageView(
            data: 'https://youtube.com/@brezykun', //ws://127.0.0.1:51819/climb?id=$climbID
            version: QrVersions.auto,
          
            ),
          ),
          
  
          const SizedBox(height: 10),
          
          TextButton(onPressed: () {
            _printQRCode(climbID);
          }, child: const Text('Print QR Code'))
        ],)
      )
    );
  });
}

void _printQRCode(String climbID) {
  const AlertDialog(title: Text('Printed'),);
}
