import '/utils/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}*/

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String txt_username = "";
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAuthentication? googleAuth;
  GoogleSignInAccount? googleSignInAccount;
  GoogleSignInAccount? googleUser;
  final FirebaseAuth auth = FirebaseAuth.instance;

/*  Future<void> signIn(BuildContext context) async {
    googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        print(user!.displayName);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }  // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }*/

/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account){
      setState(() {
        googleUser = account;
      });
      if(googleUser!= null){
        // Perform your action
      }
      googleSignIn.signInSilently();
    });
  }*/

  Future<UserCredential> signIn() async {
    googleUser = await GoogleSignIn().signIn();
    googleAuth =  await googleUser!.authentication;
    final credential =  GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    setState(() {
      txt_username = googleUser!.displayName!;
      Navigator.of(context).pushReplacementNamed("/home");
    });

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    googleSignIn.disconnect();
    setState(() {
      txt_username = "Logged out";
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio de sesión"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: Util.sizeScreen(context: context).width *
                  0.30,
              height: Util.sizeScreen(context: context).width *
                  0.30,
              child: const Image(image: AssetImage('assets/images/user_login.png')
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 80),
              child: ElevatedButton(
                style: style,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                            AssetImage('assets/images/google.png'),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Sign In with Google")
                  ],
                ),
                onPressed: (){
                signIn();
                },
              ),
            ),
            ElevatedButton(
                style: style,
                onPressed: (){
                  signOut();
                }, child: const Text("Cerrar sesión",style: const TextStyle(fontSize: 20.0),)),
            Text(
              '$txt_username',
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
