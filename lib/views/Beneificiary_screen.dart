import 'package:flutter/material.dart';
import 'package:zad/controllers/Image_adapter.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/services/beneficiary_profile_controller.dart';
import 'package:zad/models/services/local_user_data.dart';

class BeneificiaryScreen extends StatefulWidget {
  Beneficiary myUser = BeneficiaryProfileController().LoadUserDetails() as Beneficiary;
  BeneificiaryScreen({super.key});

  @override
  State<BeneificiaryScreen> createState() => _BeneificiaryScreenState();
}

class _BeneificiaryScreenState extends State<BeneificiaryScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.myUser == null? "Welcome back User!" : 'Welcome back ${widget.myUser!.fullName}!'),
      ),
      body: Column(
        children: [
          BeneficiaryProfileController().isImageExists()?Image.memory(ImageAdapter().stringToImage(widget.myUser.imageURL!)!): Container(),
          Text(widget.myUser.donationReceived.toString()),
          Text(widget.myUser.donationNeeded.toString()),
          Text(widget.myUser.approvalContext.currentState.toString()),
          Text(widget.myUser.reason.toString()),
          Text(widget.myUser.email.toString()),
          Text(widget.myUser.phoneNo.toString()),
          ElevatedButton(onPressed: (){
            BeneficiaryProfileController().UploadDocuments();
          }, child: Text('Add Documents')),
          ElevatedButton(onPressed: (){
            BeneficiaryProfileController().EditDocuments();

          }, child: Text('Edit Documents')),

        ],
      ),
    );
  }
}
