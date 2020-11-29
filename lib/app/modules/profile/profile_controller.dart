import 'package:clubbers/app/api/mock/users.dart';
import 'package:clubbers/app/api/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'profile_controller.g.dart';

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  @observable
  User currentUser;

  @action
  Future<User> getCurrentUser(id) async {
    return currentUser = await Future.delayed(
      Duration(milliseconds: 100),
      () => users.where((user) => user.id == id).first,
    );
  }
}
