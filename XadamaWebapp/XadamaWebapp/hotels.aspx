<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hotels.aspx.cs" Inherits="XadamaWebapp.hotels" %>

<html>
<head runat="server">
    <title>Hotels</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/stylehotels.css" />
</head>



<body>
<form id="form1" runat="server">
    <!--To Top Button-->
    <div class="to-top front blue">
        <a href="#nav-menu">TOP ↑</a>
    </div>

    <!--Top menu-->
    <div class="top menu front" id="nav-menu">
        <div class="bar front">
            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="logo-small margin-large" ImageUrl="~/Media/Logo/xadamaLogoSmall.png" />
            
            <div class="right" style="width: 70%;">
                <asp:Button runat="server" Text="Sign In" CssClass="button-sign text-white right margin-16" />
                <asp:Button runat="server" Text="Sign Up" CssClass="button-sign text-white right margin-16" />

                <asp:menu runat="server" Orientation="Horizontal" CssClass="margin-large right">
                    <StaticMenuItemStyle CssClass="bar-item button text-white margin-medium large" /> 
                    <DynamicMenuStyle CssClass="dynamic-menu text-white" /> 
                    <DynamicMenuItemStyle CssClass="bar-item button text-white margin-medium" /> 
                    <items>
                        <asp:menuitem text="Home"></asp:menuitem>
                        <asp:menuitem text="About"></asp:menuitem>
                        <asp:menuitem text="Hotels">
                            <asp:MenuItem text="European Palace"></asp:MenuItem>
                            <asp:MenuItem text="Oceanic Paradise"></asp:MenuItem>
                            <asp:MenuItem text="American Luxury"></asp:MenuItem>
                            <asp:MenuItem text="Asian Gardens"></asp:MenuItem>
                            <asp:MenuItem text="African Savannah"></asp:MenuItem>
                        </asp:menuitem>
                        <asp:menuitem text="Zones">
                            <asp:MenuItem text="Europe"></asp:MenuItem>
                            <asp:MenuItem text="Oceania"></asp:MenuItem>
                            <asp:MenuItem text="America"></asp:MenuItem>
                            <asp:MenuItem text="Asia"></asp:MenuItem>
                            <asp:MenuItem text="Africa"></asp:MenuItem>
                        </asp:menuitem>
                        <asp:menuitem text="Shop"></asp:menuitem>
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
           <div class="zone">
                <asp:Image ID="Image10" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/europeanpalace5.jpg" />

            </div>

            <div class="zone">
                <asp:Image ID="Image11" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/europeanpalace3.jpg" />
                 
            </div>
            <div class="zone-aux">
                
                 
            </div>

    
        </div>

       <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image1" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/europeanpalace4.jpg" />
                 
            </div>

            <div class="zone">
                <asp:Image ID="Image2" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/europeanpalace7.jpg" />
                 
            </div>

           <div class="zone-aux">
                <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Reserve now!" CssClass="button-aux botonimagen" />
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
                    <asp:Button runat="server" text="Reserve now!" CssClass="button-aux botonimagen" />
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
                    <asp:Button runat="server" text="Reserve now!" CssClass="button-aux botonimagen" />
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
           <div class="zone">
                <asp:Image ID="Image20" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/americanluxury3.jpg" />
                 
            </div>

            <div class="zone">
                <asp:Image ID="Image21" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/americanluxury5.tif" />
                 
            </div>

           <div class="zone-aux">
                <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Reserve now!" CssClass="button-aux botonimagen" />
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
                    <asp:Button runat="server" text="Reserve now!" CssClass="button-aux botonimagen" />
                </div>
                 
            </div>
    
        </div>
        
        </div>



     <div class="center footer padding-64">
        <div class="xlarge text-white">
            <p>Follow us!</p>
            <div>
                <p class="large">
                    Alicante, ES<br>
                    Phone: +34 123 456 789<br>
                    E-mail: <a class="text-white" href="mailto:xadama@xadama.com">xadama@xadama.com</a></p>
            </div>
             <asp:ImageButton ID="Image14" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/facebook.png" />
             <asp:ImageButton ID="Image15" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/twitter.png" />
             <asp:ImageButton ID="Image16" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/instagram.png" />
             <asp:ImageButton ID="Image17" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/snapchat.png" />
             <asp:ImageButton ID="Image18" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/youtube.png" />
        </div>
    </div>


    </form>
</body>
</html>
