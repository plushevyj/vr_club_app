import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: '123456');
  bool _obscurePassword = true;
  bool _isForgotPasswordHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 27, 33, 60),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: Color(0xFF3B50B5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: SvgPicture.asset(
                        'assets/icons/logo.svg',
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  const SizedBox(height: 33),
                  Text(
                    'ИС Арена',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Система управления VR-клубом',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF747894),
                    ),
                  ),
                  const SizedBox(height: 33),
                  Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthAuthenticated) {
                            context.go('/app/profile');
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 8),
                              const Text(
                                'Вход для сотрудников',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF222B45),
                                ),
                              ),
                              const SizedBox(height: 26),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Логин',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF222B45),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _loginController,
                                cursorColor: Colors.white,
                                style: const TextStyle(
                                  color: Color(0xFFC3C3C3),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Логин',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFFC3C3C3),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: SvgPicture.asset(
                                      'assets/icons/user_icon.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFF636363),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Пароль',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF222B45),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                cursorColor: Colors.white,
                                style: const TextStyle(
                                  color: Color(0xFFC3C3C3),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Пароль',
                                  hintStyle:
                                      const TextStyle(color: Color(0xFFC3C3C3)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: SvgPicture.asset(
                                      'assets/icons/password_icon.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: const Color(0xFF64748B),
                                    ),
                                    onPressed: () => setState(
                                      () =>
                                          _obscurePassword = !_obscurePassword,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFF636363),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF5136A3),
                                    foregroundColor: Colors.white,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 0),
                                    minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: state is AuthLoading
                                      ? null
                                      : () {
                                          context.read<AuthBloc>().add(
                                            AuthLoginRequested(
                                              _loginController.text,
                                              _passwordController.text,
                                            ),
                                          );
                                        },
                                  child: state is AuthLoading
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Text(
                                          'Войти',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 57),
                                child: MouseRegion(
                                  onEnter: (_) => setState(() => _isForgotPasswordHovered = true),
                                  onExit: (_) => setState(() => _isForgotPasswordHovered = false),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      foregroundColor: const Color(0xFF3755B7),
                                      backgroundColor: Colors.transparent,
                                      overlayColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      surfaceTintColor: Colors.transparent,
                                    ),
                                    child: Text(
                                      'Забыли пароль? Обратитесь к администратору',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF3755B7),
                                        decoration: _isForgotPasswordHovered
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                        decorationColor: const Color(0xFF3755B7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (state is AuthFailure)
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    state.message,
                                    style: const TextStyle(
                                        color: Colors.redAccent),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
