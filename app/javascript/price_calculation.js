document.addEventListener('turbo:load', priceCalculation);
document.addEventListener('turbo:render', priceCalculation);

function priceCalculation() {
  const priceInput = document.getElementById("item-price");
  if(priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");
      const fee = Math.floor(inputValue * 0.1);
      const profit = Math.floor(inputValue - fee);
      addTaxDom.innerHTML = Math.floor(fee);
      profitDom.innerHTML = Math.floor(profit);
    });
  }
}