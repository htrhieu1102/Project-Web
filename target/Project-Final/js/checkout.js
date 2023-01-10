const checkout = ()=>{
    let card = $("#form_card").val()
    let bank = $("#bank_name").val()
    let user = $("#idUser").val()
    let listCart =document.querySelectorAll(".product_contain")
    let dataBody = ''
    listCart.forEach((tmp)=>{
        dataBody+=tmp.querySelector("#valueCart").value + "|"
    })

    console.log(dataBody)

    $.ajax({
        url: "/Project_Web_war/checkout?action=addorder",
        type: 'POST',
        data: {card,bank,user, dataBody},
        success: function(res) {
            if(JSON.parse(res) === 1){
                swal({
                    title: "Congratulations!",
                    text: "Purchase Successfully!",
                    icon: "success",
                });
            }else{
                swal({
                    title: "Error!",
                    text: "PLease type in payment form!",
                    icon: "warning",
                });
            }
        }
    });
}