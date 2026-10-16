import 'package:flutter/material.dart';

class TanyaPetugasPage extends StatefulWidget {
  const TanyaPetugasPage({super.key});

  @override
  State<TanyaPetugasPage> createState() => _TanyaPetugasPageState();
}

class _TanyaPetugasPageState extends State<TanyaPetugasPage> {
  final List<Map<String, dynamic>> _messages = [
    {'sender': 'petugas', 'text': 'Halo, ada yang bisa kami bantu mengenai layanan kota?'},
  ];
  final _textController = TextEditingController();

  void _sendMessage() {
    if (_textController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({'sender': 'warga', 'text': _textController.text});
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F1DE),
      appBar: AppBar(
        title: const Text('Tanya Petugas'),
        backgroundColor: const Color(0xFFA33327),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isWarga = msg['sender'] == 'warga';
                return Align(
                  alignment: isWarga ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isWarga ? const Color(0xFFD4A373) : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg['text']),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(hintText: 'Ketik pesan...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFFA33327)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}