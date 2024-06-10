document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = priceInput.value;
    if (price >= 300 && price <= 9999999) {
      const fee = Math.floor(price * 0.1);
      const profitAmount = Math.floor(price - fee);

      taxPrice.textContent = fee.toLocaleString();
      profit.textContent = profitAmount.toLocaleString();
    } else {
      taxPrice.textContent = '';
      profit.textContent = '';
    }
  });
});
