window.addEventListener('change',function(){
const price = document.getElementById("item-price").value
const fee = Math.floor(price/10);
const profit = (price - fee);
const taxprice = document.getElementById("add-tax-price").innerHTML = fee;
const realprofit = document.getElementById("profit").innerHTML = profit;
})