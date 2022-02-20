import 'package:athlon_task/data/model/profile.dart';
import 'package:athlon_task/data/repositories/profile_repository.dart';
import 'package:flutter/widgets.dart';

class AvatarState extends ChangeNotifier {
  final ProfileRepository _profileRepository;

  AvatarState({required ProfileRepository customerRepository})
      : _profileRepository = customerRepository {
    _fetchCustomer();
  }

  _fetchCustomer() async {
    customer = await _profileRepository.getProfile();
  }

  Profile? _customer;
  Profile? get customer => _customer;
  set customer(Profile? customer) {
    _customer = customer;
    notifyListeners();
  }
}