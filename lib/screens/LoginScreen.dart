part of shadcn_ui_example;

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<ShadFormState>();
  bool obscure = true;

  Future<void> Submit(BuildContext context) async {
    if (formKey.currentState!.saveAndValidate()) {
      debugPrint('validation succeeded with ${formKey.currentState!.value}');
      final email = formKey.currentState!.value['email'];
      final password = formKey.currentState!.value['password'];

      try {
        await accountService.value
            ?.createEmailPasswordSession(email: email, password: password);

        final userData = await accountService.value?.get();
        currUser.value = userData;

        context.go('/stores');
      } catch (error) {
        debugPrint("catchError in RegisterScreen.dart");
        debugPrint(error.toString());
        //it responds in AppwriteException format
        //uless its something else

        if (error is AppwriteException) {
          ShowToastWithTitleAndText(
              context,
              "Failed to register due to backend. Please try again.",
              error.message ?? "Unknown error");
        } else {
          ShowToastWithTitleAndText(context,
              "Failed to register. Please try again.", error.toString());
        }
      }
    } else {
      ShowSimpleToastWithText(context, "Failed to register. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadInputFormField(
                  id: 'email',
                  label: const Text('Email'),
                  placeholder: const Text('Enter your email'),
                  validator: (v) {
                    if (v.isEmpty) return 'Email is required';
                    return null;
                  },
                ),
                ShadInputFormField(
                  id: 'password',
                  label: const Text('Password'),
                  placeholder: const Text('Password'),
                  obscureText: obscure,
                  prefix: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: ShadImage.square(size: 16, LucideIcons.lock),
                  ),
                  validator: (v) {
                    if (v.isEmpty) return 'Password is required';
                    return null;
                  },
                  suffix: ShadButton(
                    width: 24,
                    height: 24,
                    padding: EdgeInsets.zero,
                    decoration: const ShadDecoration(
                      secondaryBorder: ShadBorder.none,
                      secondaryFocusedBorder: ShadBorder.none,
                    ),
                    icon: ShadImage.square(
                      size: 16,
                      obscure ? LucideIcons.eyeOff : LucideIcons.eye,
                    ),
                    onPressed: () {
                      setState(() => obscure = !obscure);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                ShadButton(
                  child: const Text('Login'),
                  onPressed: () async => await Submit(context),
                ),
                SizedBox(height: 10),
                ShadButton(
                  child: const Text('Have an account? Login here'),
                  onPressed: () {
                    context.go('/login');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
