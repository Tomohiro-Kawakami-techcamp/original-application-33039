window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.9);
    const profitValue = document.getElementById("profit");
    profitValue.innerHTML = inputValue - Math.floor(inputValue * 0.1);
  })
});