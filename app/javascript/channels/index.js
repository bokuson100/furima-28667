window.addEventListener("load", function(){
const price = document.getElementById("item-price")
price.addEventListener("input", function(){
const priceInput =document.getElementById("item-price").value
const fee = Math.floor(priceInput/10);
const profit = (priceInput - fee);
const taxprice = document.getElementById("add-tax-price").innerHTML = fee;
const realprofit = document.getElementById("profit").innerHTML = profit;
})
})