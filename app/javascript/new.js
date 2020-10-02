function price(){

  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener('input', function(){
    value = priceInput.value
    addTaxPrice.innerHTML = value * 0.1
    profit.innerHTML = value - (value * 0.1)
  })
}

window.addEventListener('load', price);