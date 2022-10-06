import 'package:finner/common/widgets/custom_button.dart';
import 'package:finner/features/account/presentation/bloc/account_bloc.dart';
import 'package:finner/styles/theme_utils.dart';
import 'package:finner/utils/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/widgets/custom_snack_bar.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/dimmed_loading_indicator.dart';
import '../../../../common/widgets/text_button.dart';
import '../../../../utils/router.dart';

class SignInPage extends StatefulHookWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isSignUp = false;
  bool showSignUp = false;

  final _bloc = getIt<AccountBloc>();

  void animateToSignUp() {
    Future.delayed($styles.times.fast, () {
      setState(() {
        showSignUp = !showSignUp;
      });
    });
  }

  void animateToSignIn() {
    Future.delayed($styles.times.fast, () {
      setState(() {
        isSignUp = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController(text: "");
    final emailController = useTextEditingController(text: "");
    return Scaffold(
      body: BlocListener<AccountBloc, AccountState>(
        bloc: _bloc,
        listener: (context, state) {
          state.maybeWhen(
            signedIn: () {
              getIt<FinnerRouter>().replace(const HomeViewRoute());
            },
            accountCreated: () {
              // TODO: add account creation
              getIt<FinnerRouter>().replace(const HomeViewRoute());
            },
            accountError: (message) {
              CustomSnackBar.show(message, context);
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<AccountBloc, AccountState>(
          bloc: _bloc,
          builder: (context, state) {
            return state.maybeWhen<Widget>(
              accountInformationLoading: () => _loadingBody(
                context,
                emailController,
                passwordController,
              ),
              orElse: () => _body(context, emailController, passwordController),
            );
          },
        ),
      ),
    );
  }

  Widget _loadingBody(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) {
    return Stack(
      children: [
        _body(context, emailController, passwordController),
        const DimmedLoadingIndicator(),
      ],
    );
  }

  Widget _body(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _titleSection(context)),
        SizedBox(
          height: $styles.insets.sm,
        ),
        SizedBox(
          height: $styles.insets.sm,
        ),
        _textField(
          "example@gmail.com",
          false,
          emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: $styles.insets.sm,
        ),
        _textField("Password", true, passwordController),
        SizedBox(
          height: $styles.insets.sm,
        ),
        _signUpButton(emailController.text, passwordController.text),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom + $styles.insets.sm,
        ),
      ],
    );
  }

  Widget _titleSection(BuildContext context) {
    return AnimatedContainer(
      duration: $styles.times.fast,
      width: MediaQuery.of(context).size.width,
      height: 64,
      decoration: BoxDecoration(
        color: isSignUp ? $styles.colors.accent2 : $styles.colors.accent1,
      ),
      child: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: Stack(
          children: [
            _animatedSignInText(),
            _animatedSignUpText(),
            _animatedSignUpButton(),
            _animatedSignInButton(),
          ],
        ),
      ),
    );
  }

  Align _animatedSignInText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: AnimatedContainer(
        duration: $styles.times.fast,
        curve: Curves.easeOut,
        height: isSignUp ? 0 : 60,
        child: Text(
          "Sign In",
          style: $styles.text.h1.copyWith(
            fontWeight: FontWeight.bold,
            color: $styles.colors.white,
          ),
        ),
      ),
    );
  }

  Align _animatedSignUpText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: AnimatedContainer(
        duration: $styles.times.fast,
        curve: Curves.easeOut,
        height: showSignUp ? 60 : 0,
        child: Text(
          "Sign Up",
          style: $styles.text.h1.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  AnimatedPositioned _animatedSignUpButton() {
    return AnimatedPositioned(
        duration: $styles.times.fast,
        bottom: 8,
        right: isSignUp ? -160 : 0,
        child: _navigateToSignUpButton());
  }

  AnimatedPositioned _animatedSignInButton() {
    return AnimatedPositioned(
        duration: $styles.times.fast,
        bottom: 8,
        right: showSignUp ? 0 : -160,
        child: _navigateToSignInButton());
  }

  Widget _navigateToSignUpButton() {
    return Center(
      child: SizedBox(
        height: $styles.insets.xl,
        width: 160,
        child: CustomTextButton(
          onTap: () {
            if (!isSignUp) {
              setState(() {
                isSignUp = true;
              });
              animateToSignUp();
            }
          },
          padded: false,
          white: true,
          title: "Create account",
          icon: Icons.arrow_forward_outlined,
        ),
      ),
    );
  }

  Widget _navigateToSignInButton() {
    return Center(
      child: SizedBox(
        height: $styles.insets.xl,
        width: 160,
        child: CustomTextButton(
          onTap: () {
            if (showSignUp) {
              setState(() {
                showSignUp = false;
              });
              animateToSignIn();
            }
          },
          padded: false,
          title: "Log in",
          icon: Icons.arrow_forward_outlined,
        ),
      ),
    );
  }

  Widget _textField(
    String hint,
    bool hidden,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return CustomTextField(
      controller: controller,
      hidden: hidden,
      hint: hint,
      keyboardType: keyboardType,
    );
  }

  Widget _signUpButton(String email, String password) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onTap: () {
              if (isSignUp) {
                _bloc.add(AccountEvent.signUp(email, password));
              } else {
                _bloc.add(AccountEvent.signIn(email, password));
              }
            },
            title: isSignUp ? "Sign Up" : "Sign In",
          ),
        ),
        SizedBox(width: $styles.insets.xxs),
        _alternativeSignUpButtons(),
        SizedBox(width: $styles.insets.sm),
      ],
    );
  }

  Widget _alternativeSignUpButtons() {
    return InkWell(
      onTap: () {
        _bloc.add(const AccountEvent.authorizeWithGoogle());
      },
      borderRadius: BorderRadius.circular($styles.corners.md),
      highlightColor: $styles.colors.accent3,
      child: Container(
          height: $styles.insets.xxl,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular($styles.corners.md),
            border: Border.all(
              color: $styles.colors.black,
            ),
          ),
          padding: EdgeInsets.all($styles.insets.sm),
          child: const Icon(FontAwesomeIcons.google)),
    );
  }
}
