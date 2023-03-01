import 'package:flutter/material.dart';
import 'package:mvvm_management/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override

  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obscurePassword.dispose();
  }

  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText:  'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            SizedBox(height: 15.0),
            ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child){
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword.value,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText:  'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffixIcon: InkWell(
                        onTap: (){
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                        child: Icon(
                            _obscurePassword.value ? Icons.visibility_off_outlined
                                : Icons.visibility
                        ),
                      ),
                    ),
                  );
                }
            ),
            SizedBox(height: height *.1),
            RoundButton(
              title: 'SignUp',
              loading: authViewModel.singuploading,
              onPress: (){
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Your email", context);
                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Your password", context);
                }else if(_passwordController.text.length < 6){
                  Utils.flushBarErrorMessage("Please Enter minimum 6 character", context);
                } else{
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  authViewModel.signupApi(data, context);
                  print('Api Hit');
                }

              },
            ),
            SizedBox(height: height *.02),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already have an account? Login")),
          ],
        ),
      ),
    );
  }
}
