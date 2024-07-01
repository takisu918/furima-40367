window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    let fee = Math.floor(inputValue * 0.1);
    let profit = Math.floor(inputValue - fee);
    addTaxDom.innerHTML = Math.floor(fee);
    profitDom.innerHTML = Math.floor(profit);
  });
});