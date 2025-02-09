import 'package:el72ny/core/components/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScaledLineChart extends StatefulWidget {
  @override
  State<ScaledLineChart> createState() => _ScaledLineChartState();
}

class _ScaledLineChartState extends State<ScaledLineChart> {
  String selectedRange = "W";
  List<FlSpot> spots = [];

  @override
  void initState() {
    super.initState();
    updateChartData();
  }

  void updateChartData() {
    setState(() {
      switch (selectedRange) {
        case "H": // Hourly (24-hour data)
          spots = [
            const FlSpot(6, 70),
            const FlSpot(12, 50),
            const FlSpot(18, 120),
            const FlSpot(23, 180),
          ];
          break;
        case "D": // Daily (24-hour data)
          spots = [
            const FlSpot(6, 70),
            const FlSpot(12, 50),
            const FlSpot(18, 120),
            const FlSpot(23, 180),
          ];
          break;
        case "W": // Weekly (7 days)
          spots = [
            const FlSpot(1, 90),
            const FlSpot(2, 60),
            const FlSpot(3, 70),
            const FlSpot(4, 120),
            const FlSpot(5, 60),
            const FlSpot(6, 150),
          ];
          break;
        case "M": // Monthly (30 days)
          spots = [
            const FlSpot(4, 150),
            const FlSpot(9, 200),
            const FlSpot(14, 210),
            const FlSpot(19, 200),
            const FlSpot(24, 80),
            const FlSpot(27, 60),
          ];
          break;
        case "6M": // 6 Months (6 points)
          spots = [
            const FlSpot(1, 75),
            const FlSpot(2, 78),
            const FlSpot(3, 80),
            const FlSpot(4, 82),
            const FlSpot(5, 85),
          ];
          break;
        case "Y": // Yearly (12 months)
          spots = List.generate(
              12, (index) => FlSpot(index.toDouble(), 70 + (index % 10)));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
        ),
        title: const Text(
          "Line Chart",
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Buttons Row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTimeButton("H"),
                        _buildTimeButton("D"),
                        _buildTimeButton("W"),
                        _buildTimeButton("M"),
                        _buildTimeButton("6M"),
                        _buildTimeButton("Y"),
                      ],
                    ),
                  ),

                  // Text Row
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "RANGE",
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        Row(
                          children: [
                            CustomText(text: "70-90"),
                            CustomText(
                              text: " BPM",
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        CustomText(
                          text: "Fri, 25 Aug 2023",
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ]),

                  // Line chart Container
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: selectedRange == "H"
                            ? 24
                            : selectedRange == "D"
                                ? 24
                                : selectedRange == "W"
                                    ? 6
                                    : selectedRange == "M"
                                        ? 29
                                        : selectedRange == "6M"
                                            ? 5
                                            : 11,
                        minY: 40,
                        maxY: 220,
                        gridData: const FlGridData(show: true),
                        titlesData: FlTitlesData(
                          //Y-axis Settings
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: false,
                                interval: 20,
                                reservedSize: 40),
                          ),

                          //X-axis Settings
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: selectedRange == "D"
                                  ? 6
                                  : selectedRange == "W"
                                      ? 1
                                      : selectedRange == "M"
                                          ? 5
                                          : selectedRange == "6M"
                                              ? 6
                                              : selectedRange == "Y"
                                                  ? 6
                                                  : 12,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  selectedRange == "H"
                                      ? "${value.toInt()}:00"
                                      : selectedRange == "D"
                                          ? "${value.toInt()} AM"
                                          : selectedRange == "W"
                                              ? [
                                                  "Mon",
                                                  "Tue",
                                                  "Wed",
                                                  "Thu",
                                                  "Fri",
                                                  "Sat",
                                                  "Sun"
                                                ][value.toInt()]
                                              : selectedRange == "M"
                                                  ? "${value.toInt() + 1}"
                                                  : selectedRange == "6M"
                                                      ? "M${value.toInt() + 1}"
                                                      : "${value.toInt() + 1}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                );
                              },
                            ),
                          ),
                          // Opposite x-axis settings
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),

                          // Opposite y-axis settings
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 20,
                                  reservedSize: 40)),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            left: BorderSide(color: Colors.black, width: 0.2),
                            bottom: BorderSide(color: Colors.black, width: 0.2),
                            right: BorderSide(color: Colors.black, width: 0.2),
                            top: BorderSide(color: Colors.black, width: 0.2),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: spots,
                            isCurved: true,
                            color: const Color.fromARGB(255, 236, 26, 11),
                            barWidth: 5,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: const Color.fromARGB(255, 235, 29, 14)
                                  .withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Latest, 17 Aug",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              text: "70 BPM",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            // Heart Rate description
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Column(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(text: "About Heart Rate", fontSize: 20)),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: CustomText(
                      text:
                          "Heart rate refers to the number of times the heart beats per minute, and is directly related to the workload being placed on the heart.",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.justify),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTimeButton(String range) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            selectedRange == range ? Colors.black : Colors.grey[300],
        foregroundColor: selectedRange == range ? Colors.white : Colors.black,
      ),
      onPressed: () {
        setState(() {
          selectedRange = range;
          updateChartData();
        });
      },
      child: Text(range),
    );
  }
}
