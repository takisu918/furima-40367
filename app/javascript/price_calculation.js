document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  if(priceInput) {  // priceInputが存在する場合のみイベントリスナーを追加
    priceInput.removeEventListener("input", calculatePrice);    
    priceInput.addEventListener("input", calculatePrice);       
  }
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