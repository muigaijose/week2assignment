void main() {
  // List of item prices in the cart
  List<double> itemPrices = [15.0, 8.0, 22.0, 5.0, 30.0];

  // Step 1: Filter out items with price below $10 using an anonymous function
  List<double> filteredItems = itemPrices.where((item) => item >= 10.0).toList();
  print('Filtered Items: $filteredItems');

  // Step 2: Define a discount function that reduces the price by a percentage
  double discountFunction(double price, double discountPercent) {
    return price - (price * (discountPercent / 100));
  }

  // Step 3: Create the applyDiscount function (Higher-Order Function)
  List<double> applyDiscount(List<double> prices, double Function(double, double) discountFunc, double discountPercent) {
  return prices.map((price) => discountFunc(price, discountPercent)).cast<double>().toList();
}

  // Step 4: Apply a 10% discount to all items in the cart
  List<double> discountedItems = applyDiscount(filteredItems, discountFunction, 10.0);
  print('Discounted Items: $discountedItems');

  // Step 5: Define the calculateTotal function with an optional tax parameter
  double calculateTotal(List<double> prices, {double taxPercent = 0.0}) {
    double total = prices.reduce((value, element) => value + element);
    return total + (total * (taxPercent / 100));  // Apply tax if provided
  }

  // Calculate total price with 5% tax
  double totalWithTax = calculateTotal(discountedItems, taxPercent: 5.0);
  print('Total with Tax: $totalWithTax');

  // Step 6: Recursive function to calculate the factorial for the special discount
  int calculateFactorial(int n) {
    if (n <= 1) return 1;
    return n * calculateFactorial(n - 1);
  }

  // Calculate the factorial-based discount
  int itemCount = discountedItems.length;
  int factorialDiscount = calculateFactorial(itemCount);
  print('Factorial Discount: $factorialDiscount%');

  // Apply the factorial discount to the final total price
  double finalPrice = discountFunction(totalWithTax, factorialDiscount.toDouble());
  print('Final Price after Factorial Discount: $finalPrice');
}
