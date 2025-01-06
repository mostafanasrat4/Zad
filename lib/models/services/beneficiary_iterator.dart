import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/interfaces/Iterator.dart';

class BeneficiaryIterator implements Iterator<Beneficiary>
{
  final List<Beneficiary> _beneficiaries;
  int _currentIndex = 0;

  BeneficiaryIterator(this._beneficiaries);

  @override
  bool hasNext()
  {
    return _currentIndex < _beneficiaries.length;

  }

  @override
  Beneficiary? next()
  {
    if (!hasNext())
    return null;
    return _beneficiaries[_currentIndex++];
  }


}

