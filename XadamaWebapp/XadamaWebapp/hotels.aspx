<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hotels.aspx.cs" Inherits="XadamaWebapp.hotels" %>

<html>
<head runat="server">
    <title>Xadama Hotels</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/hotels.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
        $( function() {
            $( ".draggable" ).draggable();
        } );
    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            window.onscroll = function() {
                if (window.pageYOffset >= 100){
                    $('.bar').css({ transition: 'height 1s', height: 'auto' });
                    $('.logo-small').css({ transition: 'height 1s', height: '25px' });
                    $('#nav-menu .menu').css({ transition: 'margin 1s', margin: '6px 12px' });
                    $('.bar-item').css({ transition: 'font-size 1s', 'font-size': '14px' });
                    $('.button-sign').css({ transition: 'font-size 1s, padding 1s', 'font-size': '12px', padding: '6px 12px' });
                    $('.to-top').css({ display: 'inherit' });
                }
                else {
                    $('.bar').css({ transition: 'height 1s', height: 'auto' });
                    $('.logo-small').css({ transition: 'height 1s', height: '40px' });
                    $('#nav-menu .menu').css({ transition: 'margin 1s', margin: '12px 24px' });
                    $('.bar-item').css({ transition: 'font-size 1s', 'font-size': '18px' });
                    $('.button-sign').css({ transition: 'font-size 1s, padding 1s', 'font-size': '18px', padding: '12px 24px' });
                    $('.to-top').css({ display: 'none' });
                }
            }
        });
    </script>
</head>

<body>
<form id="form1" runat="server">
    <!--To Top Button-->
    <div class="to-top front blue" id="toTop">
        <a href="#nav-menu">TOP ↑</a>
    </div>

    <!--Top menu-->
    <div class="top menu front">
        <div class="bar front" id="nav-menu">
            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="logo-small margin-large" ImageUrl="~/Media/Logo/xadamaLogoSmall.png" />
            
            <div class="right" style="width: 75%;">
                <asp:Button runat="server" Text="Sign In" CssClass="button-sign text-white right margin-16 margin-right" />

                <asp:menu runat="server" Orientation="Horizontal" CssClass="right menu">
                    <StaticMenuItemStyle CssClass="bar-item button text-white margin-medium center" />
                    <DynamicMenuStyle CssClass="dynamic-menu text-white center" /> 
                    <DynamicMenuItemStyle CssClass="bar-item button text-white center padding-large" />
                    <items>
                        <asp:menuitem text="Home" NavigateUrl="main.aspx"></asp:menuitem>
                        <asp:menuitem text="About" NavigateUrl="about.aspx"></asp:menuitem>
                        <asp:menuitem text="Zones" NavigateUrl="zones.aspx">
                            <asp:MenuItem text="Europe" NavigateUrl="europe.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Oceania" NavigateUrl="africa.aspx"></asp:MenuItem>
                            <asp:MenuItem text="America" NavigateUrl="america.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Asia" NavigateUrl="asia.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Africa" NavigateUrl="africa.aspx"></asp:MenuItem>
                        </asp:menuitem>
                        <asp:menuitem text="Hotels" NavigateUrl="hotels.aspx">
                            <asp:MenuItem text="European Palace" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Oceanic Paradise" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="American Luxury" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Asian Gardens" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="African Savannah" NavigateUrl="hotels.aspx"></asp:MenuItem>
                        </asp:menuitem>
                        <asp:MenuItem Text="Tickets" NavigateUrl="tickets.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Services" NavigateUrl="services.aspx">
                            <asp:MenuItem Text="Rides" NavigateUrl="services.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Shows" NavigateUrl="services.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Restaurants" NavigateUrl="services.aspx"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:menuitem text="Shop"  NavigateUrl="shop.aspx"></asp:menuitem>
                        <asp:MenuItem Text="Promotions"  NavigateUrl="promotions.aspx"></asp:MenuItem>
                    </items>
                </asp:menu>
            </div>
        </div>
    </div>

     <div class="display-container">
         <asp:Image ID="Imagehotel" runat="server" CssClass="imgbeg" ImageUrl="~/Media/Hotels/americanluxury.jpg" />
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="HOTELS"></asp:label>
        </div>
    </div>
    
     <div class="content container padding-32">
        <p class="center large text-darkblue margin-bottom-large bold">You have multiple options when choosing an hotel,
            we have five hotels available, one for each continent.</p>
     </div>

     <div class="backimg4 display-container">
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="EUROPEAN PALACE"></asp:label>
        </div>
        <div class="display-middle-sub-aux no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="★★★★"></asp:label>
        </div>
    </div>

    <div class="content container padding-32">
        <p class="left large text-orange bold">Set in the european zone, the European Palace is a hotel with free WiFi set across the road from the London Eye. Its elegant rooms feature air conditioning and satellite TV.
        </p>
        <p class="padding-top left large text-orange margin-bottom-large bold">The hotel's International Cafè restaurant serves typical local products combined with intense fragrances and aromas. Breakfast is an American buffet.
        The bar is open till late at night and offers tasty snacks and excellent cocktails prepared by the skilled barman.</p>
    
        <div class="buttons-zone">
           <div class="zone ">
                <asp:Image ID="Image10" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/europeanpalace5.jpg" />

            </div>

            <div class="zone ">
                <asp:Image ID="Image11" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/europeanpalace3.jpg" />
                 
            </div>
            <div class="zone-aux">
                
                 
            </div>

    
        </div>

       <div class="buttons-zone">
           <div class="zone ">
                <asp:Image ID="Image1" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/europeanpalace4.jpg" />
           </div>

            <div class="zone ">
                <asp:Image ID="Image2" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/europeanpalace7.jpg" />
            </div>

           <div class="zone">
                <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Reserve now!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
                 
            </div>
    
        </div>
        
        </div>


    <div class="backimg5 display-container">
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="ASIAN GARDENS"></asp:label>
        </div>
        <div class="display-middle-sub-aux no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="★★★★★"></asp:label>
        </div>
    </div>

    <div class="content container padding-32">
        <p class="left large text-orange bold">This impressive Thai-style hotel is set in the asian zone, with magnificent views over the african one. Surrounded by pine woods, it offers 7 outdoor pools and a spa.
        </p>
        <p class="padding-top left large text-orange margin-bottom-large bold">Thai massages are available in the traditional stilt houses which are set in charming gardens with various Asian-style fountains and infinity pools.
          The spa is equipped with a heated indoor pool and hot tub, and there is also a fitness centre. Children will enjoy the pirates kids' club.
          The hotel's 4 restaurants include the Udaipur buffet restaurant and an à la carte Asian restaurant. There is also a Mediterranean and international restaurant, as well as 3 distinctive bars.</p>
    
        <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image3" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/asiangardens.jpg" />

            </div>

            <div class="zone">
                <asp:Image ID="Image4" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/asiangardens5.jpg" />
                 
            </div>
            <div class="zone-aux">
                
                 
            </div>

    
        </div>

       <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image5" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/asiangardens6.jpg" />
                 
            </div>

            <div class="zone">
                <asp:Image ID="Image6" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/asiangardens7.jpg" />
                 
            </div>

           <div class="zone-aux">
                <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Reserve now!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
                 
            </div>
    
        </div>
        
        </div>

    
    <div class="backimg6 display-container">
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="AFRICAN SAVANNAH"></asp:label>
        </div>
        <div class="display-middle-sub-aux no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="★★★★"></asp:label>
        </div>
    </div>

    <div class="content container padding-32">
        <p class="left large text-orange bold">We warmly welcome you to African Savannah Hotel on the beautiful east coast of the african zone. Here you can relax in the peaceful surroundings,
             while you are being swept away by the adventurous Zanzibar with its countless senses of impressions. 
        </p>
        <p class="padding-top left large text-orange margin-bottom-large bold">We wish to inspire our guests with an authentic atmosphere and give them the opportunity to experience the many facets
             of Zanzibar and Tanzania. Our friendly and obliging staff will make sure that you get exactly what you wish for, out of your stay.</p>
    
        <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image7" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/africansavannah.jpg" />

            </div>

            <div class="zone">
                <asp:Image ID="Image8" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/africansavannah2.jpg" />
                 
            </div>
            <div class="zone-aux">
                
                 
            </div>

    
        </div>

       <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image9" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/africansavannah3.jpg" />
                 
            </div>

            <div class="zone">
                <asp:Image ID="Image12" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/africansavannah5.jpg" />
                 
            </div>

           <div class="zone-aux">
                <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Reserve now!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
                 
            </div>
    
        </div>
        
        </div>




    <div class="backimg7 display-container">
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="AMERICAN LUXURY"></asp:label>
        </div>
        <div class="display-middle-sub-aux no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="★★★★★"></asp:label>
        </div>
    </div>

    <div class="content container padding-32">
        <p class="left large text-orange bold">Set behind the famous Fountains of Bellagio, this luxury hotel offers an upscale day spa, multiple dining options and elegant rooms with marble en suite bathrooms. 
        </p>
        <p class="padding-top left large text-orange margin-bottom-large bold">American Luxury guests can experience a variety of treatments at the spa or enjoy a massage beside one of 5 beautiful courtyard pools.
             Lush botanical gardens and a fine art gallery are open for viewing.</p>
    
        <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image13" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/americanluxury.jpg" />

            </div>

            <div class="zone">
                <asp:Image ID="Image19" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/americanluxury2.jpg" />
                 
            </div>
            <div class="zone-aux">
                
                 
            </div>

    
        </div>

       <div class="buttons-zone">
           <div class="zone ">
                <asp:Image ID="Image20" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/americanluxury3.jpg" />
                 
            </div>

            <div class="zone">
                <asp:Image ID="Image21" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/americanluxury5.tif" />
                 
            </div>

           <div class="zone-aux">
                <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Reserve now!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
                 
            </div>
    
        </div>
        
        </div>



    <div class="backimg8 display-container">
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="OCEANIC PARADISE"></asp:label>
        </div>
        <div class="display-middle-sub-aux no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="★★★★"></asp:label>
        </div>
    </div>

    <div class="content container padding-32">
        <p class="left large text-orange bold">Featuring free WiFi and a spa, Hotel Oceanic Paradise offers accommodation in the oceanic zone. The hotel has water-ski-to-door access and water sports facilities, and guests can enjoy a drink at the bar.
        </p>
        <p class="padding-top left large text-orange margin-bottom-large bold">Each room at this hotel is air conditioned and comes with a flat-screen TV. A balcony or patio are featured in certain rooms. The rooms are equipped with a private bathroom equipped with either a bath or shower.</p>
    
        <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image22" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/oceanicparadise.jpg" />

            </div>

            <div class="zone">
                <asp:Image ID="Image23" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/oceanicparadise3.jpg" />
                 
            </div>
            <div class="zone-aux">
                
                 
            </div>

    
        </div>

       <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image24" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/oceanicparadise4.jpg" />
                 
            </div>

            <div class="zone">
                <asp:Image ID="Image25" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/oceanicparadise5.jpg" />
                 
            </div>

           <div class="zone-aux">
                <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Reserve now!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
                 
            </div>
    
        </div>
        
        </div>



     <div class="slider-container margin-top">
        <div class="swiper">
            <div class="slide hide">
                <asp:Image ID="Image14" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Africa/AfricanPyramid.jpg" />
                <div class="show-text show-text-africa">
                    <asp:Label ID="Label3" runat="server" CssClass="text-white" Text="AFRICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Enjoy the wild animals and beautiful sabannahs</p>
                        <asp:Button runat="server" text="GO!" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image15" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/America/AmericanHollywood.jpg" />
                <div class="show-text show-text-america">
                    <asp:Label ID="Label12" runat="server" CssClass="text-white" Text="AMERICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Live an authentic american expirience</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-america button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image16" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Europe/EuropeanLondonEye.jpg" />
                <div class="show-text show-text-europe">
                    <asp:Label ID="Label13" runat="server" CssClass="text-white" Text="EUROPE"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Immerse yourself in the different cultures Europe has to offer</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-europe button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image17" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Asia/AsianChina.jpg" />
                <div class="show-text show-text-asia">
                    <asp:Label ID="Label10" runat="server" CssClass="text-white" Text="ASIA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Travel to the amazing China and explore the oriental culture</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-asia button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide hide">
                <asp:Image ID="Image18" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Oceania/OceanianTurtleaux.jpg" />
                <div class="show-text show-text-oceania">
                    <asp:Label ID="Label14" runat="server" CssClass="text-white" Text="OCEANIA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Love the long beaches and the paradisiac landscapes</p>
                        <asp:Button runat="server" text="GO!" />
                    </div>
                </div>
            </div>
        </div>
        <div class=" arrow arrow-prev left front text-white xlarge">
            <p style="margin: 13px">❮</p>
        </div>
        <div class="arrow arrow-next right front text-white xlarge">
            <p style="margin: 15px">❯</p>
        </div>
    </div>

    <div class="container center footer padding-64" id="footer-bar">
        <div class="row-padding center">
            <div class="col half">
                <div class="left">
                    <asp:Label runat="server" Text="Xadama" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:menuitem text="Home" NavigateUrl="main.aspx"></asp:menuitem>
                            <asp:menuitem text="About" NavigateUrl="about.aspx"></asp:menuitem>
                        </items>
                    </asp:menu>

                    <asp:Label runat="server" Text="Services" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:MenuItem Text="Rides" NavigateUrl="services.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Shows" NavigateUrl="services.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Restaurants" NavigateUrl="services.aspx"></asp:MenuItem>
                        </items>
                    </asp:menu>
                </div>

                <div class="left">
                    <asp:Label runat="server" Text="Hotels" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:MenuItem text="European Palace" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Oceanic Paradise" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="American Luxury" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Asian Gardens" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="African Savannah" NavigateUrl="hotels.aspx"></asp:MenuItem>
                        </items>
                    </asp:menu>
                </div>
                <div class="left">
                    <asp:Label runat="server" Text="Zones" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:MenuItem text="Europe" NavigateUrl="europe.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Oceania" NavigateUrl="africa.aspx"></asp:MenuItem>
                            <asp:MenuItem text="America" NavigateUrl="america.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Asia" NavigateUrl="asia.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Africa" NavigateUrl="africa.aspx"></asp:MenuItem>
                        </items>
                    </asp:menu>
                </div>

                <div class="left">
                    <asp:Label runat="server" Text="Shop" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:menuitem text="Shop"  NavigateUrl="shop.aspx"></asp:menuitem>
                            <asp:MenuItem Text="Tickets" NavigateUrl="tickets.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Promotions"  NavigateUrl="promotions.aspx"></asp:MenuItem>
                        </items>
                    </asp:menu>
                </div>
            </div>

            <div class="xlarge text-white col half">
                <p>Follow us!</p>
                <div>
                    <p class="large">
                        Alicante, ES<br>
                        Phone: +34 123 456 789<br>
                        E-mail: <a class="text-white" href="mailto:xadama@xadama.com">xadama@xadama.com</a></p>
                </div>
                 <asp:ImageButton ID="ImageButton2" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/facebook.png" />
                 <asp:ImageButton ID="ImageButton3" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/twitter.png" />
                 <asp:ImageButton ID="ImageButton4" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/instagram.png" />
                 <asp:ImageButton ID="ImageButton5" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/snapchat.png" />
                 <asp:ImageButton ID="ImageButton6" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/youtube.png" />
            </div>
        </div>
    </div>
    <div class="sub-footer">
        <asp:ImageButton ID="ImageButton7" runat="server" CssClass="logo-small margin-large left" ImageUrl="~/Media/Logo/xadamaLogoSmall.png" />
        <p style="float: left; top: 10px">© Información legal 2017. Xadama. Todos los derechos reservados.</p>
    </div>
</form>
</body>
</html>