document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.removeEventListener("input", calculatePrice);    // まずイベントリスナーを削除します
  priceInput.addEventListener("input", calculatePrice);       // 次にイベントリスナーを追加します
});

function calculatePrice() {
  const inputValue = this.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  let fee = inputValue * 0.1;
  let profit = Math.floor(inputValue - fee);
  addTaxDom.innerHTML = Math.floor(fee);
  profitDom.innerHTML = Math.floor(profit);
}