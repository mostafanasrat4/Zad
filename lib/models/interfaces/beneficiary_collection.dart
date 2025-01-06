import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/interfaces/Iterator.dart';

abstract class BeneficiaryCollection
{
  Iterator<Beneficiary> createIterator();
}