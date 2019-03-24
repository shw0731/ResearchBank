// (c) Jakub Chaber

var siteObj={
   links:[
    {
      title:'Link1',
      title:'Title1',
      content:'1Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto ullam minima, veniam, maiores molestiae assumenda pariatur corrupti voluptatum id ea commodi aperiam dignissimos fuga, exercitationem illo eius praesentium suscipit. Velit.</div><div>Tenetur atque sunt eligendi quia sequi quo molestias numquam officiis ea impedit error pariatur, explicabo sapiente nobis odit assumenda laboriosam nostrum saepe, quaerat ad! Voluptatibus quasi, at soluta consequatur ratione!'
    },
    {
      title:'Link2',
      title:'Title2',
      content:'2Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto ullam minima, veniam, maiores molestiae assumenda pariatur corrupti voluptatum id ea commodi aperiam dignissimos fuga, exercitationem illo eius praesentium suscipit. Velit.</div><div>Tenetur atque sunt eligendi quia sequi quo molestias numquam officiis ea impedit error pariatur, explicabo sapiente nobis odit assumenda laboriosam nostrum saepe, quaerat ad! Voluptatibus quasi, at soluta consequatur ratione!'
    },

    {
      title:'Link3',
      title:'Title3',
      content:'3Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto ullam minima, veniam, maiores molestiae assumenda pariatur corrupti voluptatum id ea commodi aperiam dignissimos fuga, exercitationem illo eius praesentium suscipit. Velit.</div><div>Tenetur atque sunt eligendi quia sequi quo molestias numquam officiis ea impedit error pariatur, explicabo sapiente nobis odit assumenda laboriosam nostrum saepe, quaerat ad! Voluptatibus quasi, at soluta consequatur ratione!'
    },

   ]};

  for(let i=0; i< document.getElementById('modalmenu').getElementsByTagName('li').length;i++ ){

document.getElementsByTagName('li')[i].addEventListener('click',function(e){
    let temp =e.target.attributes[0].value;
    console.log(temp);
    document.getElementById('modal').classList.toggle('active');
    document.getElementById('title').innerText=siteObj.links[temp].title;
    document.getElementById('content').innerText=siteObj.links[temp].content;
});
    

  }



document.getElementById('close').addEventListener('click', function(){
document.getElementById('modal').classList.toggle('active');
})