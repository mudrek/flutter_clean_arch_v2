import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/dto/login_user_dto.dart';
import 'package:flutter_clean_arch_v2/features/login/domain/value_objects/email.dart';
import 'package:flutter_clean_arch_v2/features/login/presentation/login_page/atoms/login_atom.dart';
import 'package:flutter_clean_arch_v2/features/login/presentation/login_page/states/login_states.dart';

import '../../domain/value_objects/password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  get _isFormValid => _formKey.currentState?.validate();

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    context.select(() => [loginState, doLogin]);

    final isLoading = loginState.value is LoadingLoginState;

    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: Email.formFieldValidateEmail(),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  validator: Password.formFieldValidatePassword(),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_isFormValid) {
                            doLogin.setValue(
                              LoginUserDTO(
                                email: Email.create(_emailController.text),
                                password: _passwordController.text,
                              ),
                            );
                          }
                        },
                  child: SizedBox(
                    width: 150,
                    child: Center(
                      child: isLoading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text('Entrar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
