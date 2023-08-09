import 'package:asp/asp.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/dto/login_user_dto.dart';
import 'package:flutter_clean_arch_v2/features/login/presentation/login_page/states/login_states.dart';

final loginState = Atom<LoginStates>(InitialLoginState());

final doLogin = Atom<LoginUserDTO>(LoginUserDTO.empty());
