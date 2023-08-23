import 'package:flutter/material.dart';

class FilterData {
  final String label;
  final int count;
  FilterData({required this.label, required this.count});
}

class Filter extends StatelessWidget {
  final int all, open, closed;
  final int idx;
  final Function(int) setIdx;
  const Filter({
    super.key,
    required this.all,
    required this.open,
    required this.closed,
    required this.idx,
    required this.setIdx,
  });
  @override
  Widget build(BuildContext context) {
    final filters = [
      FilterData(label: "All", count: all),
      FilterData(label: "Open", count: open),
      FilterData(label: "Closed", count: closed),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 32,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) {
            return InkWell(
              onTap: () {
                setIdx(i);
              },
              child: FilterItem(
                data: filters[i],
                isActive: i == idx,
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
