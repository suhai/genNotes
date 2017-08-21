/* jQuery: MY NOTES */
/* jQuery Events
  click
  dblclick
  mouseenter
  mouseleave
  mousedown
  mouseup
  hover
*/

/* jQuery Form Events
  focus
  blur
  change
*/


/* jQuery Actions
  hide
  show
*/

$(function(){
  /* 01.  */
  $("span.child").prev().css({
    "color": "blue", 
    "border": "5px solid cyan"
  });
  
  

  /* 02.  */
  $("#cereal").on("click", function(){
    $("#two").hide();
  });

  $("p.two").on("click", function(){
    $("#two").show();
    $("#cereal").hide();
  });

  $("div.two").on("click", function(){
    $("#cereal").hide();
    $(".two").hide();
  });

  $("#two").on("click", function(){
    $("#cereal").show();
    $(".two").show();
  });



  /* 03.  */
  $("p.three1").on("mouseenter", function(){
    $("input#three1").css({ 
      "border": "5px solid salmon"
    });
  });

  $("p.three2").on("mouseleave", function(){
    $(".three2").css({ 
      "background-color": "gray"
    });
  });


  $("p.three3").hover(
    function(){
      $(".three3").html("<b>You Just MouseEntered Me!</b>");
      $(".three3").css({ 
        "background-color": "orange"
      });
      $("#three3").css({ 
        "background-color": "yellowgreen",
        "border": "2px dashed white"
      });
    },
    function(){
      $(".three3").html("<b>Huraaay You Just MouseLeft Me!</b>");
      $(".three3").css({ 
        "background-color": "white"
      });
      $("#three3").css({ 
        "background-color": "hotpink",
        "border": "2px dashed maroon"
      });
    }
  );

  $("#btn31").click(function(){
    $("#three31").text("I am the New Text!");
  });
  $("#btn32").click(function(){
      $("#three32").html("<b>I am the New HTML!</b>");
  });
  $("#btn33").click(function(){
      $("#three33").val("My Name Is John Bull");
  });


  $("#three4").on("focus", function(){
    $("#three4").css({ 
      "border": "5px solid darkgray",
      "background-color": "orange"
    });
  });

  $("#three4").on("blur", function(){
    $("#three4").css({ 
      "border": "5px solid darkgray",
      "background-color": ""
    });
  });

  $("#three4").on("change", function(){
    $("#three4").css({ 
      "border": "5px solid black",
      "font-weight": "bold",
      "font-family": "Times",
      "font-size": "20px",
      "background-color": "beige"
    });  
  });



  $(".three5b").one("click", function(){
    alert("Hello How May B Help You?")
  });

  $(".three5c").on("click", function(){
    alert("Hello How May C Help You?")
  });

  $(".three5").on({
    "dblclick": function() { 
      alert("Do Not DoubleClick Me Again, Please")
    },
    "mouseover": function() { 
      $("p.three5c").off("click");
      // $(".three5").html(
      //   "<div class='tooltip'>Hover over me <span class='tooltiptext'>Tooltip text</span> </div>"
      // );
      // $(".tooltip").css({ 
      //   "position": "relative",
      //   "display": "inline-block",
      //   "border-bottom": "1px dotted black",
      // });
      // $(".tooltip .tooltiptext").css({ 
      //   "visibility": "hidden",
      //   "width": "120px",
      //   "background-color": "#555",
      //   "color": "#fff",
      //   "text-align": "center",
      //   "border-radius": "6px",
      //   "padding": "5px 0",
      //   "position": "absolute",
      //   "z-index": "1",
      //   "bottom": "125%",
      //   "left": "50%",
      //   "margin-left": "-60px",
      //   "opacity": "0",
      //   "transition": "opacity 1s",
      // });
      // $(".tooltip .tooltiptext::after").css({ 
      //   "content": "",
      //   "position": "absolute",
      //   "top": "100%",
      //   "left": "50%",
      //   "margin-left": "-5px",
      //   "border-width": "5px",
      //   "border-style": "solid",
      //   "border-color": "#555 transparent transparent transparent",
      // });
      // $(".tooltip:hover .tooltiptext").css({ 
      //   "visibility": "visible",
      //   "opacity": "1"
      // });
    }
  });



  /* 04.  */
  $("#fourbtn2").on("click", function(){
    $("#four-img").hide("slow");
    $(".four1").hide("normal");
    $(".four2").hide("fast");
    $(".four3").hide(500);
    $(".four4").hide(2000);
    $(".four5").hide(5000);
    $(".fourp1").html("<button id='fourbtn1'>Undo Last Action!</button>");
    $(".fourp2").html("");
  });

  $(".fourp1").on("click", function(){
    $("#four-img").show("slow");
    $(".four1").show("normal");
    $(".four2").show("fast");
    $(".four3").show(500);
    $(".four4").show(2000);
    $(".four5").show(5000);
    $(".fourp1").html("");
    $(".fourp2").html("<button id='fourbtn1'>Click Me!</button>");
    $(".fourp3").html("<button id='fourbtn3'>Click Me Too!</button>");
  });



  /* 05.  */
  $(".five1").hide();
  $(".five2").hide();
  $(".five3").hide();
  $(".five4").hide();
  $(".five5").hide();

  $(".fivep2").on("click", function(){
    $("#five-img").slideUp(3000);
    $(".five0").addClass("red");
    $(".five1").fadeIn(500).addClass("blue");
    $(".five2").fadeOut(1000);
    $(".five3").fadeIn(2000);
    $(".five4").fadeOut(3000);
    $(".five5").fadeIn(5000);
    $(".fivep1").html("");
    $(".fivep1").html("<button id='fivebtn1'>Slide Image Down</button>");
    $(".fivep2").html("");
  });

  $(".fivep1").on("click", function(){
    $("#five-img").slideDown(3000);
    $(".five0").removeClass("red");
    $(".five1").fadeOut(500);
    $(".five2").fadeIn(1000);
    $(".five3").fadeOut(2000);
    $(".five4").fadeIn(3000);
    $(".five5").fadeOut(5000);
    $(".fivep1").html("");
    $(".fivep2").html("<button id='fivebtn1'>Slide Image Up</button>");
    $(".fivep1").html("");
  });

  $("#fiveTogbtn").on("click", function(){
    $("#fiveTog").toggle(1000);
    $("#five-img").slideToggle(3000);
    $("#four-img").fadeToggle(5000);
  });

  

  /* 06.  */
  $(".six0").hide();
  $(".six1").hide();
  $(".six2").hide();

  $(".six0").fadeIn(3000, function() {
    $(this).addClass("red")
  })

  $(".six1").fadeIn(4000, function() {
    $(this).addClass("yellow")
  })

  $(".six2").fadeIn(5000, function() {
    $(this).addClass("blue")
  })

  $(".six1").on("click", function() {
    $(".six1").stop();
  })
  
  $(".six5").hide(5000).delay(5000).show(5000);


  /* 07.  */
  // .animate( properties [, duration ] [, easing ] [, complete ] )

  // .animate( properties, options )

  $("#seven1").click(function() {
    $(this).before("<div>Added Animation Below.</div>");
    $("#block1").animate({
      opacity: .5,
      marginLeft: "+=50",
      height: "100px"
    }, 3000, "linear", function() {
      $(this).after("<div>Added Animation Above.</div>");
    });
  });

  $("#seven2").click(function() {
    $("#block2")
      .animate({ width: "80%" }, 1000)
      .animate({ fontSize: "40px" }, 2000)
      .animate({ borderLeftWidth: "50px" }, 3000)
  });


  /* 08.  */
  /* jQuery: Getting and Setting Content and Attributes */

  $("#eightbtn1").click(function() {
    $("p.eigthp1").text(function(i, oldText) {
      return ($("#fcc").attr("href"));
    }),
    $("p.eigthp2").html(function(i, oldText) {
      return "<button>" + ($("#fcc").attr("href")) + "</button>";
    }),
    $("p.eigthp3").text(function(i, oldText) {
      return "["+i+"]: " + oldText + ", You Should Check Out " + ($("#fcc").attr("href")).toUpperCase() + ". It is Dope!";
    })
  })

  $("#eightbtn2").click(function() {

  });

  $("#eightbtn3").click(function() {
    $("#name").val("Suhai Yehuza")
  });


  /* 09.  */
  /* jQurey: Adding and Removing Elements */
  $("#ninebtn1").on("click", function(){
    $('.nine-target')
    .append('<div class="nine-child">I have just been APPENDED to the Main DIV</div>', '<p>Heyyy! I was also Appended!!</p>')  
  });

  $("#ninebtn2").on("click", function(){
    $('.nine-target')
    .prepend('<div class="nine-child">I have just been PREPENDED to the Main DIV</div>')  
  });

  $("#ninebtn3").on("click", function(){
    $('.nine-target').before('<div class="nine-sibling">I have just been added BEFORE the Main DIV</div>')   
  });

  $("#ninebtn4").on("click", function(){
    $('.nine-target').after('<div class="nine-sibling">I have just been added AFTER the Main DIV</div>')   
  });

  $("#ninebtn5").on("click", function(){
    $('.nine-target').empty();
    alert("You just Emptied the Main DIV"); 
    $('.nine-target')
    .prepend('<p class="dummy">And I can be removed by the Remove Button.</p>') 
    .append('<p class="not-dummy">But I cannot be removed by the Remove Button.</p>') 
  });

  $("#ninebtn6").on("click", function(){
    $('p').remove('.dummy');   
    alert("You just Removed the Paragraph with the 'dummy' class."); 
  });
  


  /* 10.  */
  $("#tenbtn1").click(function(){
    $("p.ten").text(function(i, oldText) {
      return "My Font Size is : " + ($(".ten").css("font-size"));
    })
  });

  $("#tenbtn2").click(function(){
    $("p.tenb").html(function(i, oldText) {
      return "My Font Family is : " + "<button>" + ($(".tenb").css("fontFamily")) + "</button>";
    })
  });

  $("#tenbtn3").click(function(){
    $(".tenc").css("fontSize", "30px");
    $(".tenc").css("font-family", "Courier New");
  });

  $("#tenbtn4").click(function(){
    $(".tend").css({
      fontSize: "50px",
      color: "blue",
      backgroundColor: "yellow"
    });
  });

  $("#tenbtn5").click(function(){
    $(".tene").addClass("red")
  });

  $("#tenbtn6").click(function(){
    $(".tenf").removeClass("cadetblue")
  });

  $("#tenbtn7").click(function(){
    $(".tenn p").toggleClass("large");
  });
  
  $("#tenbtn8").click(function(){
    $(".pre-ten").text(function(i, oldText) {
      return "This Paragraph Had The class 'red' : " + ($(".pre-ten").hasClass("red"));
    })  
  });
  



  /* 11.  */
  $("#elevenbtn1").click(function(){
    $("li").parent().css({
      "color": "red",
      "border": "5px dashed salmon"
    })
  });

  $("#elevenbtn2").click(function(){
    $("span").parent().css({
      "color": "black",
      "border": "5px solid black"
    })
  });

  $("#elevenbtn3").click(function(){
    $("span").parents().css({
      "color": "blue",
      "border": "10px solid green"
    })
  });

  $("#elevenbtn4").click(function(){
    $("li").parentsUntil("div").css({
      "color": "hotpink",
      "border": "10px solid maroon"
    })
  });

  $("#elevenbtn5").click(function(){
    $("li").children().css({
      "color": "black",
      "border": "10px dashed black"
    })
  });

  $("#elevenbtn6").click(function(){
    $("span").children().css({
      "fontSize": "18px",
      "border": "5px solid white"
    })
  });

  $("#elevenbtn7").click(function(){
    $("span").children("h2").css({
      "color": "gray",
      "border": "5px solid green"
    })
  });

  $("#elevenbtn8").click(function(){
    $("ul").find("span").css({
      "fontSize": "25px",
      "border": "5px dashed yellowgreen"
    })
  });

  $("#elevenbtn9").click(function(){
    $("ul").find("*").css({
      "fontSize": "15px",
      "backgroundColor": "tomato"
    })
  });

  $("#elevenbtn10").click(function(){
    $("h2").siblings().css({
      "borderRadius": "5px",
      "backgroundColor": "cadetblue"
    })
  });

  $("#elevenbtn11").click(function(){
    $("h2").siblings("p").css({
      "fontFamily": "Courier New",
      "backgroundColor": "transparent"
    })
  });

  $("#elevenbtn12").click(function(){
    $("h2").next().css({
      "borderRadius": "35px",
      "backgroundColor": "gray"
    })
  });

  $("#elevenbtn13").click(function(){
    $("h2").nextAll().css({
      "fontFamily": "Times New Roman",
      "color": "black",
      "backgroundColor": "cyan"
    })
  });

  $("#elevenbtn14").click(function(){
    $("span.child").nextUntil("h3").css({
      "borderRadius": "2px",
      "backgroundColor": "purple"
    })
  });

  $("#elevenbtn15").click(function(){
    $("span.child").prevUntil("li").css({
      "borderRadius": "15px",
      "backgroundColor": "hotpink"
    })
  });

  

  /* 12.  */
  // jQuery: AJAX = Asynchronous JavaScript And XML


  /* 13.  */


  /* 14.  */


  /* 15.  */


  /* 16.  */


  /* 17.  */


  /* 18.  */


  /* 19.  */


  /* 20.  */


  /* 21.  */


  /* 22.  */


  /* 23.  */


  /* 24.  */


  /* 25.  */


  /* 26.  */


  /* 27.  */


  /* 28.  */


  /* 29.  */


  /* 30.  */
  
});
