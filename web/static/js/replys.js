window.setInterval(request, 1000);

function request() {
    let reply = new XMLHttpRequest();
    reply.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            let myObj = JSON.parse(this.responseText);

            // document.getElementById("demo").innerHTML = myObj.name;
            let replist = document.getElementById("reply-list");
            replist.innerHTML = "";
            if(myObj == null){
                return;
            }
            myObj.forEach(
                it => {
                    let li = document.createElement("li");
                    li.setAttribute("class","mdui-divider-inset mdui-m-y-0");
                    replist.appendChild(li);
                    let li2 = document.createElement("li");
                    li2.setAttribute("class","mdui-list-item mdui-ripple");
                    let div1 = document.createElement("div");
                    div1.setAttribute("class","mdui-list-item-content mdui-container");
                    let div2 = document.createElement("div");
                    div2.setAttribute("class","mdui-list-item-title");
                    div2.innerText = "FROM:  "+it.name;
                    let div3 = document.createElement("div");
                    div3.setAttribute("class","mdui-list-item-text mdui-text-color-theme-text");
                    div3.innerText = it.msg;
                    div1.appendChild(div2);
                    div1.appendChild(div3);
                    li2.appendChild(div1);
                    replist.appendChild(li2)
                }
            );
            window.scrollTo(0,document.body.scrollHeight);
        }
    };
    reply.open("GET", "./reply", true);
    reply.send();
}

