
const render = (arr)=>{
    let elem = ``
    let total = 0;
    let totalPrice = 0;
    arr.map((tmp)=>{
        totalPrice = tmp.pro.price * tmp.quantity
        total += tmp.quantity * tmp.pro.price
        elem += `<div class="product_contain" id="item-cart-${tmp.pro.id}">
                <div class="image">
                    <img src="${tmp.pro.img}">
                </div>
                <div class="product_details">
                    <div class="name">${tmp.pro.name}
                    </div>
                </div>
                <div class="price"><p>
                    ${cd(tmp.pro.price)}</p></div>
                <div class="quantity">
                    <style>
                        #wrapper .container .cart .product_contain .quantity{
                            padding-left: 0px;
                        }
                        #wrapper .container .cart .product_contain .quantity .dec_button{
                            color: black;
                            font-size: 20px;
                            padding: 5px 10px;
                        }
                        #wrapper .container .cart .product_contain .quantity .inc_button{
                            color: black;
                            font-size: 20px;
                            padding: 5px 10px;
                        }
                        #wrapper .container .cart .product_contain .total{
                            padding-left: 40px;
                        }
                        #wrapper .container .cart .product_contain .remove{
                            padding-left: 0px;
                        }
                    </style>
                    <a onclick="dec(${tmp.pro.id})" class="dec_button" id="decrease"><i class="fa-solid fa-minus"></i></a>
                    <input id="quantity_Cart" type="number" value="${tmp.quantity}" min="1">
                    <a onclick="inc(${tmp.pro.id})" class="inc_button" id="increase"><i class="fa-solid fa-plus"></i></a>

                </div>
                <div class="total">
                    <p id="price">
                        ${cd( totalPrice ) }
                    </p>
                </div>
                <div class="remove">
                    <button onclick="removeItem(${tmp.pro.id})"  id="remove_button"><a><i class="fas fa-trash-alt"></i></a></button>
                    <style>
                        #wrapper .container .cart .product_contain .remove button a{
                            color: black;
                        }
                    </style>
                </div>
            </div>`
    })
    document.querySelector("#products").innerHTML = elem
    // document.querySelector("#price").innerHTML = totalPrice
    document.querySelector("#totalBill").innerHTML = cd(total)
    document.querySelector("#vatBill").innerHTML = cd((total*10)/100);
    document.querySelector("#sumBill").innerHTML = cd(total + (total*10)/100);

}

const removeItem = (idproduct)=>{
    var request = new XMLHttpRequest();
    request.open("POST", "cart?action=del&id=" + idproduct);
    request.onreadystatechange = function () {
        if (this.readyState === 4 && this.status ===200){

        }
    };

    request.send();
}

const inc = (idproduct)=>{
    var request = new XMLHttpRequest();
    request.open("POST", "cart?action=inc&id=" + idproduct);
    request.onreadystatechange = function() {
        if(this.readyState === 4 && this.status === 200) {
            let jsonRes = JSON.parse(this.responseText)
            console.log(jsonRes)
            console.log(jsonRes.pro.price * jsonRes.quantity)
            getCart()
        }
    };

    request.send();
}

const dec = (idproduct)=>{
    var request = new XMLHttpRequest();
    request.open("POST", "cart?action=dec&id=" + idproduct);
    request.onreadystatechange = function() {
        if(this.readyState === 4 && this.status === 200) {
            let jsonRes = JSON.parse(this.responseText)
            console.log(jsonRes)
            getCart()
        }
    };

    request.send();
}
const getCart = ()=>{
    $.ajax({
        url: "/Project_Web_war/cart",
        type: 'GET',
        success: function(res) {
            render(JSON.parse(res))
            console.log(JSON.parse(res))
        }
    });
}
getCart()
const cd = (total)=>{
    let totalPriceDisplay = "";
    let totalPrice = total + "";
    if (totalPrice.length > 6){
        totalPriceDisplay = totalPrice.substring(0, totalPrice.length - 6) + "." + totalPrice.substring(totalPrice.length - 6, totalPrice.length - 3) + "." + totalPrice.substring(totalPrice.length - 3);
    } else {
        totalPriceDisplay = totalPrice.substring(0, totalPrice.length - 6) + totalPrice.substring(totalPrice.length - 6, totalPrice.length - 3) + "." + totalPrice.substring(totalPrice.length - 3);
    }
    return totalPriceDisplay + "d";
}