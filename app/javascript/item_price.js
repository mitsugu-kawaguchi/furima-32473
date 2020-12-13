window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  })
  const priceAdd = document.getElementById("add-tax-price");
  console.log(priceAdd);
  const priceProfit = document.getElementById("profit");
  console.log(priceProfit);
})