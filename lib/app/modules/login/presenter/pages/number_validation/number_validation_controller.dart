import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/domain/usecases/validation_phone.dart';
import 'package:mobx/mobx.dart';

import '../../../presenter/stores/auth_store.dart';

part 'number_validation_controller.g.dart';

@Injectable()
class NumberValidationController = _NumberValidationControllerBase with _$NumberValidationController;

abstract class _NumberValidationControllerBase with Store {
  final AuthStore authStore;
  final ValidationPhone validationPhone;

  _NumberValidationControllerBase(this.authStore, this.validationPhone);

  final String? phone = Modular.args.queryParams["phone"];

  List<TextEditingController> inputs = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<FocusNode> focus = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  Future<void> validation() async {
    final code = inputs.map((e) => e.text).join("");
    final result = await validationPhone(code);
    result.fold((l) {}, (r) {
      authStore.setUser(authStore.user?.copyWith(phone: phone));
      redirect();
    });
  }

  void redirect() {
    Modular.to.pushReplacementNamed("/home");
  }
}
