import 'package:flutter/material.dart';
import 'package:my_first_app/customs.dart';

bool passwordVisibility = false;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: myGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: myAppBar(),
        drawer: myDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.all(Radius.circular(40.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    myCustomText(
                        label: "Email",
                        hint: "Enter your email",
                        icon: Icons.email,
                        controller: emailController),
                    myCustomText(
                        label: "Password",
                        hint: "Enter your password",
                        icon: Icons.lock,
                        controller: passwordController),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                  ),
                  onPressed: () {
                    if (emailController.text == 'admin' &&
                        passwordController.text == 'admin') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginSuccess()));
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Login Successful"),
                              content: const Text("Welcome Admin"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"))
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Login Unsuccessful"),
                              content: const Text("Please, try again"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"))
                              ],
                            );
                          });
                    }
                  },
                  child: const Text("Sign in", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding myCustomText({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 8),
            child: Text("$label :",
                style: const TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            padding: const EdgeInsets.all(10),
            child: TextField(
              onSubmitted: (value) {},
              obscureText: label == "Password" ? passwordVisibility : false,
              controller: controller,
              decoration: InputDecoration(
                suffix: label == 'Password'
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisibility = !passwordVisibility;
                          });
                        },
                        icon: Icon(passwordVisibility
                            ? Icons.visibility
                            : Icons.visibility_off))
                    : null,
                prefixIcon: Icon(icon),
                label: Text(label),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Success"),
      ),
      body: const Center(
        child: Text("Welcome Admin"),
      ),
    );
  }
}
