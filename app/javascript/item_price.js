window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    console.log("イベント発火");
  })
  const priceAdd = document.getElementById("add-tax-price");
  console.log(priceAdd);
  const priceProfit = document.getElementById("profit");
  console.log(priceProfit);
})