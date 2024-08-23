import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojek/popup_contry.dart';
import 'package:gojek/popup_cookie.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo_gojek.png'),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Icon(CupertinoIcons.question_circle_fill),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/phone.png'),
              const SizedBox(height: 16),
              const Text(
                'Aktifkan Akunmu Kembali',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter your registered phone number to log in',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 17),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      child: TextButton(
                        onPressed: () {
                          // Show Kode Negara Page as a popup
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => KodeNegaraDialog(),
                            isScrollControlled: true,
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFEDEDED),
                          padding: EdgeInsets.symmetric(horizontal: 6),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/indonesia_flag.png',
                                  height: 24),
                              SizedBox(width: 8),
                              Text(
                                '+62',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _controller..text = '87786642031',
                      decoration: InputDecoration(
                        labelText: 'Phone number *',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        hintText: '87786642031',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(CupertinoIcons.xmark_circle_fill),
                          onPressed: () {
                            setState(() {
                              _controller.text = '+62';
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Handle issue with number button press
                  print('Issue with number button pressed');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Issue with number?',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => CookiePopup(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Numpad(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}

class Numpad extends StatelessWidget {
  final TextEditingController controller;

  Numpad({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumpadButton(
                    number: '1', onPressed: () => controller.text += '1'),
                NumpadButton(
                    number: '2',
                    letters: 'ABC',
                    onPressed: () => controller.text += '2'),
                NumpadButton(
                    number: '3',
                    letters: 'DEF',
                    onPressed: () => controller.text += '3'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumpadButton(
                    number: '4',
                    letters: 'GHI',
                    onPressed: () => controller.text += '4'),
                NumpadButton(
                    number: '5',
                    letters: 'JKL',
                    onPressed: () => controller.text += '5'),
                NumpadButton(
                    number: '6',
                    letters: 'MNO',
                    onPressed: () => controller.text += '6'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumpadButton(
                    number: '7',
                    letters: 'PQRS',
                    onPressed: () => controller.text += '7'),
                NumpadButton(
                    number: '8',
                    letters: 'TUV',
                    onPressed: () => controller.text += '8'),
                NumpadButton(
                    number: '9',
                    letters: 'WXYZ',
                    onPressed: () => controller.text += '9'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumpadButton(number: '', onPressed: null),
                NumpadButton(
                  number: '0',
                  onPressed: () => controller.text += '0',
                ),
                IconButton(
                  icon: const Icon(Icons.backspace),
                  onPressed: () => controller.text =
                      controller.text.substring(0, controller.text.length - 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String number;
  final String? letters;
  final VoidCallback? onPressed;

  NumpadButton({required this.number, this.letters, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    if (number.isEmpty) {
      backgroundColor = Colors.grey[200]!;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (letters != null)
              Text(
                letters!,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
