const buildHTML = (XHR) => {
  const item = XHR.response.post;
  //
  const html = `
  <div class="yell-content">
    ${item.content}
    ${item.created_at.strftime("%m")}
  </div>`;
  return html
}




function post (){
  const submit = document.getElementById("submit");
  //submitを定義してこの後に使えるようにしている
  submit.addEventListener("click", (e) => {
    //クリックした際のアクションを定義している
    e.preventDefault();
    //二重送信を防ぐための記述
    const form = document.getElementById("form");
    //index.htmlにて送信フォームで受け取った値を下の行の引数として使うため定義している。
    const formData = new FormData(form);

    const XHR = new XMLHttpRequest();

    XHR.open("POST", "/posts", true);

    XHR.responseType = "json";
    //JavaScriptの値としてレスポンスを受け取るため事前に定義している
    XHR.send(formData);
    //
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const list = document.getElementById("list");
      const formText = document.getElementById("content")
      list.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = "";
    };
  });
}

window.addEventListener('load', post);