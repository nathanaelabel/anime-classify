part of 'pages.dart';

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);
  static const routeName = "/FormPage";

  @override
  // ignore: library_private_types_in_public_api
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameText = TextEditingController();
  final TextEditingController emailText = TextEditingController();
  final TextEditingController phoneText = TextEditingController();
  final TextEditingController cityText = TextEditingController();

  String? name = "";
  String? email = "";
  String? phone = "";
  String? city = "";

  @override
  void dispose() {
    nameText.dispose();
    emailText.dispose();
    phoneText.dispose();
    cityText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            key: _formKey,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
                child: TextFormField(
                  controller: nameText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value!.isEmpty ? 'Full Name is required' : null,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email Address is required";
                    } else if (!EmailValidator.validate(value)) {
                      return "Email Address must be valid";
                    }
                    return null;
                    // return !EmailValidator.validate(value.toString()) ? "Email Address must be valid" : null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enter your email address',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value!.isEmpty ? 'Phone is required' : null,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 48),
                child: TextFormField(
                  controller: cityText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value!.isEmpty ? 'City is required' : null,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'Enter your city',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 108),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pinkAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: (() {
                      if (nameText.text.isEmpty ||
                          emailText.text.isEmpty ||
                          phoneText.text.isEmpty ||
                          cityText.text.isEmpty) {
                        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        //   content: Text("Please fill all the fields!"),
                        //   duration: Duration(milliseconds: 1000),
                        // ));
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text("Order Failed"),
                                content:
                                    const Text("Please fill all the fields!"),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: (() {
                                        Navigator.of(context).pop(context);
                                      }),
                                      child: const Text("Ok"))
                                ],
                              );
                            }));
                      } else {
                        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        //   content: Text("Your order has been submitted!"),
                        //   duration: Duration(milliseconds: 1000),
                        // ));
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text("Order Submitted"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Name: $name"),
                                    Text("Email: $email"),
                                    Text("Phone: $phone"),
                                    Text("City: $city"),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: (() {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const HomePage())),
                                            ((route) => false));
                                      }),
                                      child: const Text("Ok"))
                                ],
                              );
                            }));
                      }
                    }),
                    child:
                        const Text('Submit', style: TextStyle(fontSize: 18))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
