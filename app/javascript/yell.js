function home() {
  const items = document.getElementsByClassName("item-img-content");
  for (let i = 0; i < items.length; i++) {
    let item = items.item(i);
    let itemInner = item.getElementsByClassName("item-img-content-z hidden").item(0);
    item.addEventListener("mouseover", function(){
      itemInner.setAttribute("style", "display:block;");
    });
    item.addEventListener("mouseout", function(){
      itemInner.removeAttribute("style", "display:block;");
    });
  }

}
window.addEventListener('load', home);