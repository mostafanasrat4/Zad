import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/controllers/donor_dashboard_controller.dart';
import 'package:zad/controllers/providers/theme_controller.dart';
import 'package:zad/main.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/views/widgets/beneficiary_card.dart';

class DonorDashboardScreen extends StatefulWidget {
  const DonorDashboardScreen({super.key});

  @override
  State<DonorDashboardScreen> createState() => _DonorDashboardScreenState();

}

class _DonorDashboardScreenState extends State<DonorDashboardScreen> {
  List<Beneficiary> ben=[];
  initState() {
    super.initState();
    load_data();
  }
  load_data() async {
    ben = await DonorDashboardController().getBeneficiaries();
  return ben;
  }
  _refresh() async {
    setState(() {
      load_data();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<theme>().dark?CupertinoColors.darkBackgroundGray:CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        backgroundColor: context.watch<theme>().dark?Colors.black:Colors.white,
        title: const Text('Donor Dashboard'),
        actions: [
          IconButton(onPressed: (){
            context.read<theme>().changeTheme();
          }, icon: context.read<theme>().dark?const Icon(Icons.light_mode):const Icon(Icons.dark_mode))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ben.isNotEmpty?
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: ben.map((Beneficiary b)=> GestureDetector(child: BeneficiaryCard(name: b.fullName!, image: b.imageURL), onTap: (){
                //toDO: navigate to beneficiary profile
              },)).toList(),

        ):const Center(child: Text('No beneficiaries available')),
        ],
            ),
      ),);
  }
}
