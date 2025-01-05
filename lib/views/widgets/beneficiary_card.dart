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
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: decodedImage != null? Image.memory(decodedImage): const Center(child: Text("No Image")),
          ),
          Text(name),
        ],
      ),
    );
  }
}
