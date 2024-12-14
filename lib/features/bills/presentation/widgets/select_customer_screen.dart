import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/bills/presentation/widgets/payment_details_screen.dart';
import 'package:restaurant_app/features/customers/domain/entities/dto/filter_customers_dto.dart';
import 'package:restaurant_app/features/customers/presentation/providers/customers_providers.dart';
import 'package:restaurant_app/features/orders/domain/entities/bill.dart';
import 'package:restaurant_app/features/orders/presentation/providers/bills_provider.dart';
import 'package:restaurant_app/features/shared/widgets/custom_text_form_field.dart';

class SelectCustomerScreen extends ConsumerStatefulWidget {
  final Bill bill;
  const SelectCustomerScreen({super.key, required this.bill});

  @override
  SelectCustomerScreenState createState() => SelectCustomerScreenState();
}

class SelectCustomerScreenState extends ConsumerState<SelectCustomerScreen> {
  Timer? _debounce;
  bool withFinalCustomer = false;

  FilterCustomersDTO filters = FilterCustomersDTO();
  final TextEditingController searchController = TextEditingController();

  isValid() {
    return withFinalCustomer;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bill = widget.bill;
    final customersState = ref.watch(customersProvider);
    final customerBill = ref.watch(customerBillProvider);
    return Scaffold(
      appBar: AppBar(
          // title: Text('Select customer'),
          ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Select customer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  title: const Text('Final customer',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  // subtitle: const Text('09710298'),
                  onTap: () {
                    // Navigator.of(context).pop();
                  },
                  trailing: Checkbox(
                    value: withFinalCustomer,
                    onChanged: (value) {
                      setState(() {
                        withFinalCustomer = value ?? false;
                        ref
                            .read(customerBillProvider.notifier)
                            .setCustomer(null);
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                label: 'Search',
                onChanged: (search) => {
                  if (_debounce?.isActive ?? false) _debounce?.cancel(),
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    ref
                        .read(filterCustomersProvider.notifier)
                        .setFilters(filters.copyWith(search: search));
                  })
                },

                // hint: filterProducts,
                // onChanged: (p0) => ref
                //     .read(productNameProvider.notifier)
                //     .changeProductName(p0),

                // onChanged: (value) {
                //   ref
                //       .read(activeSectionProvider.notifier)
                //       .searchSections(value);
                // },
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text('Customers',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('Total 3')
                ],
              ),
              const SizedBox(height: 10),
              customersState.when(
                data: (customers) {
                  return Column(
                    children: [
                      for (var customer in customers)
                        Card(
                          child: ListTile(
                            title: Text(customer.person.name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            subtitle: Text(customer.person.email ?? ''),
                            onTap: () {
                              // Navigator.of(context).pop();
                            },
                            trailing: Checkbox(
                              value: customer == customerBill,
                              onChanged: withFinalCustomer
                                  ? null
                                  : (value) {
                                      ref
                                          .read(customerBillProvider.notifier)
                                          .setCustomer(customer);
                                    },
                            ),
                          ),
                        )
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Text('Error: $error'),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onLongPress: null,
            onPressed: withFinalCustomer || customerBill != null
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return PaymentDetailsScreen(bill: bill);
                        },
                      ),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.transparent,
              disabledForegroundColor: Colors.grey,
            ),
            child: const Text('Continue'),
          ),
        ),
      ),
    );
  }
}

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
