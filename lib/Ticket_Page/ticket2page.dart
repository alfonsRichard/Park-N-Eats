import 'package:flutter/material.dart';
import 'package:myapp/Ticket_Page/eticketpage.dart';

class TicketOnly2Page extends StatefulWidget {
  const TicketOnly2Page({super.key});

  @override
  _TicketOnly2PageState createState() => _TicketOnly2PageState();
}

class _TicketOnly2PageState extends State<TicketOnly2Page>
    with SingleTickerProviderStateMixin {
  DateTime _selectedDate = DateTime.now();
  int _selectedTickets = 1;
  int _selectedMonth = DateTime.now().month;
  bool _isDateSelected = false;
  late PageController _pageController; // Declare PageController
  late TabController _tabController; // Declare TabController
  String? _selectedBundlingOption;

  final List<String> _months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  final Map<String, int> _prices = {
    'Ticket Only': 100000,
    'Bundle Package': 150000,
  };

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: 0); // Initialize PageController
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Add listener for tab controller
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose PageController
    _tabController.dispose(); // Dispose TabController
    super.dispose();
  }

  void _selectDate(int day, String ticketType) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedMonth, day);
      _isDateSelected = true;
    });
    _showBottomSheet(ticketType);
  }

  void _showBottomSheet(String ticketType) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Jatim Park 2',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      if (ticketType == 'Bundle Package') ...[
                        const Text(
                          'Select Additional Bundling Options:',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioListTile(
                              title: const Text('Bundle 1'),
                              value: 'KF + Fastrack',
                              groupValue: _selectedBundlingOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedBundlingOption = value as String;
                                });
                              },
                            ),
                            RadioListTile(
                              title: const Text('Bundle 2'),
                              value: 'Other Bundling Option',
                              groupValue: _selectedBundlingOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedBundlingOption = value as String;
                                });
                              },
                            ),
                            RadioListTile(
                              title: const Text('Bundle 3'),
                              value: 'Another Bundling Option',
                              groupValue: _selectedBundlingOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedBundlingOption = value as String;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                      ],
                      const Text(
                        'Select number of tickets:',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_selectedTickets > 1) {
                                  _selectedTickets--;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text('$_selectedTickets'),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _selectedTickets++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Total Price: Rp. ${_prices[ticketType]! * _selectedTickets}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle ticket purchase logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ETicketPage(
                                ticketType: _tabController.index == 0
                                    ? 'Ticket Only'
                                    : 'Bundle Package',
                                selectedTickets: _selectedTickets,
                                selectedDate: _selectedDate,
                                selectedBundlingOption: _selectedBundlingOption,
                              ),
                            ),
                          );
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCalendar(String ticketType) {
    int daysInMonth = DateTime(_selectedDate.year, _selectedMonth + 1, 0).day;
    int firstWeekdayOfMonth =
        DateTime(_selectedDate.year, _selectedMonth, 1).weekday;

    List<TableRow> calendarRows = [];
    List<Widget> rowChildren = [];

    // Fill the first row with empty cells if the month does not start on Monday
    for (int i = 1; i < firstWeekdayOfMonth; i++) {
      rowChildren.add(Container());
    }

    for (int day = 1; day <= daysInMonth; day++) {
      rowChildren.add(_buildCalendarCell(day, ticketType));
      if (rowChildren.length == 7) {
        calendarRows.add(TableRow(children: List.from(rowChildren)));
        rowChildren.clear();
      }
    }

    // Fill the last row with empty cells if it does not end on Sunday
    if (rowChildren.isNotEmpty) {
      while (rowChildren.length < 7) {
        rowChildren.add(Container());
      }
      calendarRows.add(TableRow(children: rowChildren));
    }

    return Table(children: calendarRows);
  }

  Widget _buildCalendarCell(int date, String ticketType) {
    return InkWell(
      onTap: () {
        _selectDate(date, ticketType);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(date.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketOption(String option) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Month',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<int>(
          value: _selectedMonth,
          items: List.generate(
            12,
            (index) => DropdownMenuItem(
              value: index + 1,
              child: Text(_months[index]),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _selectedMonth = value!;
              _isDateSelected = false;
            });
          },
        ),
        const SizedBox(height: 24.0),
        const Text(
          'Select Date',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        _buildCalendar(option),
        const SizedBox(height: 24.0),
        if (_isDateSelected)
          ElevatedButton(
            onPressed: () {
              // Handle ticket purchase logic here
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ETicketPage(
                    ticketType: _tabController.index == 0
                        ? 'Ticket Only'
                        : 'Bundle Package',
                    selectedTickets: _selectedTickets,
                    selectedDate: _selectedDate,
                    selectedBundlingOption: _selectedBundlingOption,
                  ),
                ),
              );
            },
            child: const Text('Submit'),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Periksa apakah _tabController sudah diinisialisasi
    if (_tabController.length == 2) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Ticket'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/img/jatim2.jpg',
                        height: 100,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jatim Park 2',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Jl. Oro-oro Ombo No. 9, Kecamatan Batu, Malang, Jawa Timur',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black, // Set label color to black
                  tabs: const [
                    Tab(
                      text: 'Ticket Only',
                    ),
                    Tab(
                      text: 'Bundle Package',
                    ),
                  ],
                ),
                SizedBox(
                  height: 500, // Fixed height to show TabBarView properly
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _buildTicketOption('Ticket Only'),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _buildTicketOption('Bundle Package'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // Jika _tabController belum diinisialisasi, tampilkan loading atau pesan kesalahan
      return Scaffold(
        appBar: AppBar(
          title: const Text('Loading...'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: TicketOnly2Page(),
  ));
}
