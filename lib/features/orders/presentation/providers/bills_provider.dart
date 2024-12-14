import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:restaurant_app/features/customers/domain/entities/customer.dart';
import 'package:restaurant_app/features/finances/domain/entities/cash_register.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/domain/repositories/bills_repository.dart';
import 'package:restaurant_app/features/orders/infraestructura/datasources/bills_datasource_impl.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/dto/update_bill_dto.dart';
import 'package:restaurant_app/features/orders/infraestructura/repository/bills_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bills_provider.g.dart';

@Riverpod(keepAlive: true)
BillsRepository billsRepository(BillsRepositoryRef ref) {
  final accessToken = ref.watch(authProvider).token ?? '';

  final repository = BillsRepositoryImpl(
      datasource: BillsDatasourceImpl(accessToken: accessToken));
  return repository;
}

@Riverpod(keepAlive: true)
class BillById extends _$BillById {
  @override
  Future<Bill> build(int id) {
    final repository = ref.watch(billsRepositoryProvider);
    return repository.getBill(id);
  }

  void setBill(Bill bill) {
    state = AsyncValue.data(bill);
  }

  void clearBill() {
    state = const AsyncValue.loading();
  }
}

@Riverpod(keepAlive: true)
class PaymentMethodBill extends _$PaymentMethodBill {
  @override
  PaymentMethod build() {
    return PaymentMethod.cash;
  }

  void setPaymentMethod(PaymentMethod paymentMethod) {
    state = paymentMethod;
  }
}

@Riverpod(keepAlive: true)
class CustomerBill extends _$CustomerBill {
  @override
  Customer? build() {
    return null;
  }

  void setCustomer(Customer? customer) {
    state = customer;
  }
}

@Riverpod(keepAlive: true)
class CashRegisterBill extends _$CashRegisterBill {
  @override
  CashRegister? build() {
    return null;
  }

  void setCashRegister(CashRegister cashRegister) {
    state = cashRegister;
  }
}

@Riverpod(keepAlive: true)
class ReceivedAmountBill extends _$ReceivedAmountBill {
  @override
  double build() {
    return 0;
  }

  void setReceivedAmount(double receivedAmount) {
    state = receivedAmount;
  }
}

@Riverpod(keepAlive: true)
class DiscountBill extends _$DiscountBill {
  @override
  double build() {
    return 0;
  }

  void setDiscount(double discount) {
    state = discount;
  }
}

@Riverpod(keepAlive: true)
class ActiveBill extends _$ActiveBill {
  @override
  Bill? build() {
    return null;
  }

  void setActiveBill(Bill active) {
    state = active;
  }
}

@Riverpod(keepAlive: true)
class PayBillDTO extends _$PayBillDTO {
  @override
  UpdateBillDTO? build() {
    // final bill = ref.watch(billByIdProvider.no);
    // ref.read(billByIdProvider).asData;
    return null;
  }

  void setPayBillDTO(UpdateBillDTO payBillDTO) {
    state = payBillDTO;
  }
}