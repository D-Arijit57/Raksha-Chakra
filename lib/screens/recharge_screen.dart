import 'package:flutter/material.dart';
import 'package:raksha/widgets/app_drawer.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _selectedProvider = 'Airtel Prepaid';
  String _payFrom = 'Savings - 5010 XXXX';
  bool _isAmountSelected = true;

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF667EEA);
    const purple = Color(0xFF764BA2);
    const green = Color(0xFF4CAF50);
    const softGreen = Color(0xFFE8F5E9);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: blue),
        title: const Text(
          'Mobile Recharge',
          style: TextStyle(color: blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: blue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.power_settings_new, color: blue),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Gradient header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [blue, purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Recharge',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Recharge your mobile instantly',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            color: softGreen,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: green.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.phone_iphone,
                          color: green,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mobile Number',
                              style: TextStyle(color: green, fontSize: 13),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _mobileController,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter mobile number',
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black54,
                                      ),
                                      isDense: true,
                                    ),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.search, color: green),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  const SizedBox(height: 4),
                  const Text(
                    'Service Provider',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  DropdownButton<String>(
                    value: _selectedProvider,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: green),
                    underline: Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    items:
                        <String>[
                          'Airtel Prepaid',
                          'Jio Prepaid',
                          'Vi Prepaid',
                          'BSNL Prepaid',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedProvider = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Recharge with',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _isAmountSelected = true),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _isAmountSelected ? green : Colors.white,
                              border: Border.all(color: green),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            alignment: Alignment.center,
                            child: Text(
                              'Amount',
                              style: TextStyle(
                                color: _isAmountSelected ? Colors.white : green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _isAmountSelected = false),
                          child: Container(
                            decoration: BoxDecoration(
                              color: !_isAmountSelected ? green : Colors.white,
                              border: Border.all(color: green),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            alignment: Alignment.center,
                            child: Text(
                              'Plan',
                              style: TextStyle(
                                color: !_isAmountSelected
                                    ? Colors.white
                                    : green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    enabled: _isAmountSelected,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      labelStyle: const TextStyle(color: Colors.grey),
                      hintText: 'Enter amount',
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Maximum limit of ₹ 3000',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Pay From',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  DropdownButton<String>(
                    value: _payFrom,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: green),
                    underline: Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    items:
                        <String>[
                          'Savings - 5010 XXXX',
                          'Current - 1234 XXXX',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _payFrom = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'CONTINUE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: green),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                              color: green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
