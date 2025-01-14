import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/interfaces/Iterator.dart';
import 'package:zad/models/interfaces/beneficiary_collection.dart';
import 'package:zad/models/services/beneficiary_iterator.dart';

class BeneficiaryList implements BeneficiaryCollection
{
  final List<Beneficiary> _beneficiaries;
  BeneficiaryList(this._beneficiaries);

  @override
  Iterator<Beneficiary> createIterator() {
    return BeneficiaryIterator(_beneficiaries);
  }

  List<Beneficiary> get beneficiaries => _beneficiaries;
}