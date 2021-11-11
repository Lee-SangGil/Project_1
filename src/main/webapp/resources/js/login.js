
 function add() {
    $.ajax({
        url: 'crawling.do',
        type: 'get',
        success: function(data) {
        	crawlingData = setData(data);
            console.log(crawlingData);
            if(crawlingData.length === 0){
            	location.href="moveLogin.do";
            }
            let randomNumber = Math.floor(Math.random() * 7);
            console.log(randomNumber);
            console.log(crawlingData[randomNumber].img);
            poster.setAttribute('src', crawlingData[randomNumber].img);
        },
    });
}