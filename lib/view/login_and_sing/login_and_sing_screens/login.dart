class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 80),

            const Text(
              "Login",
              style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 40),

            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D9CDB),
                minimumSize: const Size(double.infinity,50),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>const HomeScreen(),
                  ),
                );
              },
              child: const Text("Login"),
            ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>const SignUpScreen(),
                  ),
                );
              },
              child: const Text("Create Account"),
            )

          ],
        ),
      ),
    );
  }
}