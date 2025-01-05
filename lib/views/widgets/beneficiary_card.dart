import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zad/controllers/Image_adapter.dart';

class BeneficiaryCard extends StatelessWidget {
  String name;
  String? image;


  BeneficiaryCard({super.key, required this.name, this.image});

  @override
  Widget build(BuildContext context) {
    var decodedImage;
    if (image != null){
     decodedImage = ImageAdapter().stringToImage(image!);
    }
    return Container(
      width: 120,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(35),
            ),
            child: decodedImage != null?
            ClipOval(child: Image.memory(decodedImage,fit: BoxFit.cover,),)
                : const Icon(Icons.person,size: 40,color: Colors.blueAccent,)
          ),
          const SizedBox(height: 8,),
          Text(name,
          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
