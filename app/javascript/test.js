function test() {
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

  const items_2 = document.getElementsByClassName("item-img-content-2");
  for (let i = 0; i < items_2.length; i++) {
    let item = items_2.item(i);
    let itemInner = item.getElementsByClassName("item-img-content-2-z hidden").item(0);
    item.addEventListener("mouseover", function(){
      itemInner.setAttribute("style", "display:block;");
    });
    item.addEventListener("mouseout", function(){
      itemInner.removeAttribute("style", "display:block;");
    });
  }

  const items_3 = document.getElementsByClassName("item-img-content-3");
  for (let i = 0; i < items_3.length; i++) {
    let item = items_3.item(i);
    let itemInner = item.getElementsByClassName("item-img-content-3-z hidden").item(0);
    item.addEventListener("mouseover", function(){
      itemInner.setAttribute("style", "display:block;");
    });
    item.addEventListener("mouseout", function(){
      itemInner.removeAttribute("style", "display:block;");
    });
  }

  const items_4 = document.getElementsByClassName("item-img-content-4");
  for (let i = 0; i < items_4.length; i++) {
    let item = items_4.item(i);
    let itemInner = item.getElementsByClassName("item-img-content-4-z hidden").item(0);
    item.addEventListener("mouseover", function(){
      itemInner.setAttribute("style", "display:block;");
    });
    item.addEventListener("mouseout", function(){
      itemInner.removeAttribute("style", "display:block;");
    });
  }

  const items_5 = document.getElementsByClassName("item-img-content-5");
  for (let i = 0; i < items_5.length; i++) {
    let item = items_5.item(i);
    let itemInner = item.getElementsByClassName("item-img-content-5-z hidden").item(0);
    item.addEventListener("mouseover", function(){
      itemInner.setAttribute("style", "display:block;");
    });
    item.addEventListener("mouseout", function(){
      itemInner.removeAttribute("style", "display:block;");
    });
  }

  const items_6 = document.getElementsByClassName("item-img-content-6");
  for (let i = 0; i < items_6.length; i++) {
    let item = items_6.item(i);
    let itemInner = item.getElementsByClassName("item-img-content-6-z hidden").item(0);
    item.addEventListener("mouseover", function(){
      itemInner.setAttribute("style", "display:block;");
    });
    item.addEventListener("mouseout", function(){
      itemInner.removeAttribute("style", "display:block;");
    });
  }

}
window.addEventListener('load', test);

