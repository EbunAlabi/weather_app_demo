
import 'package:weather_app/app/sign_in/signin_view_model.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather_app/widgets/custom_button.dart';
import 'package:weather_app/widgets/custom_text_form_field.dart';
import 'package:weather_app/widgets/loading.dart';

class SignInView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignInViewModel>.withConsumer(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: AppColors.blackShade1,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0, bottom: 24.0),
                      child: Center(
                        child: Center(
                          child: SizedBox(height: 150,)),
                      ),
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 26.0,
                        vertical: 26.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CustomTextFormField(
                            borderWidth: 1.0,
                            borderStyle: BorderStyle.solid,
                            hasPrefixIcon: true,
                            textInputType: TextInputType.emailAddress,
                            hintText: 'Email',
                            prefixIcon: Text(""),
                            controller: emailController,
                          ),
                          CustomTextFormField(
                            borderWidth: 1.0,
                            borderStyle: BorderStyle.solid,
                            hasPrefixIcon: true,
                            textInputType: TextInputType.visiblePassword,
                            prefixIcon: Text(''),
                            hintText: 'Password',
                            obscured: true,
                            controller: passwordController,
                          ),
                          CustomButton(
                            title: 'Log In',
                            textStyle: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                            color: AppColors.white,
                            onPressed: () {
                              model.login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            },
                            // textStyle: textTheme.button,
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'New user? ',
                                style: TextStyle(
                                    color: AppColors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  model.navigateToSignUp();
                                },
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  child: model.busy ? const Loading() : Container(),
                ),
              ],
            ),
          )),
    );
  }
}
