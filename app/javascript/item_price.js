window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    const priceProfit = document.getElementById("profit");
    priceProfit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
 });
});