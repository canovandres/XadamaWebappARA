<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="XadamaWebapp.about" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama About</title>
    <link rel="stylesheet" type="text/css" href="Style/about.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="padding-64" style="margin-bottom: -50px">
        <asp:Image runat="server" ImageUrl="~/Media/Others/about-us.jpg" CssClass="col" Height="350px" />
    </div>

    <div class="content container padding-64">
        <p class="center xxlarge text-orange margin-bottom-large bold uppercase padding-large">Xadama Amusement Park</p>
        <div class="col half">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Media/Hotels/americanluxury2.jpg" CssClass="image-slideshow-about" />
            <ajaxToolkit:SlideShowExtender ID="SlideShowExtender1" runat="server" 
                TargetControlID="Image1"
                SlideShowServiceMethod="GetSlides"
                AutoPlay="true"
                Loop="true" />
        </div>
        <div class="col half">
            <p class="center large text-darkblue margin-bottom-large padding-large margin-large">Xadama is the perfect destination to spend a great holiday 
                with your family, partner or friends while you enjoy the best entertainment that southern Europe has to offer; and all in a setting with perfect weather 
                where you will have a fantastic time at Europe’s leading theme park and water park while enjoying the sun, beach and the exquisite Mediterranean cuisine.
                Xadama is located on the Costa Blanca and is one of the main destinations for tourism and holidays in Spain. Our facilities are ideally 
                situated close to Alicante and the towns of Elche and Calpe. At Xadama you can enjoy a theme park and fabulous hotels. And thanks to its exceptional 
                location, your holiday is completed by surrounding beaches, shopping areas, sports facilities, outdoor activities and restaurants where you can 
                discover the delicious Mediterranean cuisine.
                Xadama has 4 and 5-star hotels. Staying at any of these Xadama hotels is the perfect guarantee of first-rate service and comfort 
                while enjoying the Xadama parks and spending a few delightful days at the coast.</p>
        </div>
    </div>

    <!--How to arrive-->
    <div class="backimgarrive display-container">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center padding-medium xxlarge wide darkblue" text="HOW TO ARRIVE"></asp:Label>
        </div>
    </div>

    <div class="content container center padding-64">
        <div class="row-padding">
            <div class="col half">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6270.52780188392!2d-0.5171617125935198!3d38.323325877376675!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd62361b1c9736fd%3A0xf455cc4450eae028!2sPartida+Agua+Amarga%2C+2A%2C+03008%2C+Alicante!5e1!3m2!1ses!2ses!4v1493334554674" height="400" frameborder="0" style="border:0; width: 100%" allowfullscreen></iframe>
            </div>
            <div class="col half xlarge text-darkblue margin-64">
                <asp:Image runat="server" ImageUrl="~/Media/Icons/map.png" CssClass="image-about margin-right" /><span style="vertical-align: super;"> Alicante, Spain</span><br/>
                <asp:Image runat="server" ImageUrl="~/Media/Icons/phone.png" CssClass="image-about margin-right" /><span style="vertical-align: super;"> +34 123 456 789</span><br/>
                <asp:Image runat="server" ImageUrl="~/Media/Icons/email.png" CssClass="image-about margin-right" /><span style="vertical-align: super;"> xadama@xadama.com</span><br/>
            </div>
        </div>
    </div>


    <!--Social Networks-->
    <div class="backimgsocial display-container">
        <div class="display-middle no-opacity">
            <asp:Label runat="server" CssClass="center padding-medium xxlarge wide darkblue" text="SOCIAL NETWORKS"></asp:Label>
        </div>
    </div>

    <div class="content container center padding-64">
        <p class="xxlarge">Social networks will be displayed here</p>
    </div>

    <!--Contact Form-->
    <div class="backimgcontact display-container">
        <div class="display-middle no-opacity">
            <asp:Label runat="server" CssClass="center padding-medium xxlarge wide darkblue" text="CONTACT"></asp:Label>
        </div>
    </div>
    
    <div class="form-content container padding-64">
        <div class="field">
            <asp:Label runat="server" Text="Name: " CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
        </div>
        <div class="field half">
            <asp:Label runat="server" Text="First Surname: " CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox1Surname" runat="server"></asp:TextBox>
        </div>
        <div class="field half">
            <asp:Label runat="server" Text="Second Surname: " CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox2Surname" runat="server"></asp:TextBox>
        </div>
        <div class="field half">
            <asp:Label runat="server" Text="Email: " CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
        </div>
        <div class="field half">
            <asp:Label runat="server" Text="Phone: " CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
        </div>
        <div class="field">
            <asp:Label runat="server" Text="Type: " CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="DropDownType" runat="server"></asp:DropDownList>
        </div>
        <div class="field">
            <asp:Label runat="server" Text="Message: " CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div class="send-button">
            <asp:Button runat="server" CssClass="center button padding-medium button-slice xxlarge wide" text="SEND"></asp:Button>
        </div>
    </div>

    <div class="slider-container margin-top">
        <div class="swiper">
            <div class="slide hide">
                <asp:Image ID="Image9" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Africa/AfricanPyramid.jpg" />
                <div class="show-text show-text-africa">
                    <asp:Label ID="Label3" runat="server" CssClass="text-white" Text="AFRICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Enjoy the wild animals and beautiful sabannahs</p>
                        <asp:Button runat="server" text="GO!" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image10" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/America/AmericanHollywood.jpg" />
                <div class="show-text show-text-america">
                    <asp:Label ID="Label12" runat="server" CssClass="text-white" Text="AMERICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Live an authentic american expirience</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-america button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image11" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Europe/EuropeanLondonEye.jpg" />
                <div class="show-text show-text-europe">
                    <asp:Label ID="Label13" runat="server" CssClass="text-white" Text="EUROPE"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Immerse yourself in the different cultures Europe has to offer</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-europe button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image12" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Asia/AsianChina.jpg" />
                <div class="show-text show-text-asia">
                    <asp:Label ID="Label10" runat="server" CssClass="text-white" Text="ASIA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Travel to the amazing China and explore the oriental culture</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-asia button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide hide">
                <asp:Image ID="Image13" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Oceania/OceanianTurtleaux.jpg" />
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

</asp:Content>