import 'package:flutter/material.dart';

class FilterData {
  final String label;
  final int count;
  FilterData({required this.label, required this.count});
}

final filters = [
  FilterData(label: "All", count: 5),
  FilterData(label: "Open", count: 2),
  FilterData(label: "Closed", count: 3),
];

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int _currentIdx = 1;

  void _setCurrentIdx(int idx) {
    setState(() {
      _currentIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 32,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, idx) {
            return InkWell(
              onTap: () {
                _setCurrentIdx(idx);
              },
              child: FilterItem(
                data: filters[idx],
                isActive: idx == _currentIdx,
              ),
            );
          },
          separatorBuilder: (ctx, idx) {
            return const SizedBox(width: 8);
          },
          itemCount: filters.length,
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final FilterData data;
  final bool isActive;

  const FilterItem({
    super.key,
    required this.data,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final c = isActive
        ? const Color.fromARGB(255, 0, 136, 255)
        : Colors.grey.shade600;
    return Row(
      children: [
        Text(data.label, style: TextStyle(color: c)),
        const SizedBox(width: 6),
        Container(
          decoration: BoxDecoration(
            color: c.withOpacity(isActive ? 1 : .3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Text(
              "${data.count}",
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        )
      ],
    );
  }
}
