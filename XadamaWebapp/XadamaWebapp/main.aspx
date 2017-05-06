<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="XadamaWebapp.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama</title>
    <script type="text/javascript">
        $( function() {
            $( ".draggable" ).draggable();
        } );
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            window.onscroll = function () {
                if (window.pageYOffset >= 100) {
                    $('#buyButton').removeClass('buy-button');
                    $('#buyButton').addClass('buy-button-small');
                }
                else {
                    $('#buyButton').removeClass('buy-button-small');
                    $('#buyButton').addClass('buy-button');
                }

                if (window.pageYOffset >= 1850) {
                    $('.image-appear1').css({ transition: 'transform 2s', transform: 'translateX(0px)' });
                    $('.image-appear2').css({ transition: 'transform 1.8s', transform: 'translateX(0px)' });
                    $('.image-appear3').css({ transition: 'transform 1.6s', transform: 'translateX(0px)' });
                    $('.image-appear4').css({ transition: 'transform 1.4s', transform: 'translateX(0px)' });
                }
                else {
                    $('.image-appear3').css({ transition: 'transform 2s', transform: 'translateX(2000px)' });
                    $('.image-appear2').css({ transition: 'transform 1.8s', transform: 'translateX(2000px)' });
                    $('.image-appear4').css({ transition: 'transform 1.6s', transform: 'translateX(2000px)' });
                    $('.image-appear1').css({ transition: 'transform 1.4s', transform: 'translateX(2000px)' });
                }
            }
        });
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Button id="buyButton" runat="server" Text="BUY Tickets" CssClass="buy-button front orange center padding-left-large"/>

    <!--Video-->
    <div class="video-container display-container">
        <div class="display-middle front">
            <asp:Label ID="Label1" runat="server" CssClass="center padding-large black xxlarge wide appear" Text="XADAMA"></asp:Label>
        </div>
        <div class="display-middle-sub front">
            <asp:Label ID="Label2" runat="server" CssClass="center padding-large black large wide appear" Text="Amusement Park in Alicante"></asp:Label>
        </div>
        <video loop muted autoplay>
            <source src="/Media/Logo/XadamaSpot.webm" type="video/webm">
            <source src="/Media/Logo/XadamaSpot.mp4" type="video/mp4">
        </video>
    </div>

    <div class="content container padding-64">
        <p class="center xxlarge text-orange margin-bottom-large bold uppercase padding-large">Our park is distributed in 5 zones, one for each continent. Find them out!</p>
        <p class="center large text-darkblue margin-bottom-large padding-large margin-large">Discover the six continents of one of Europe&#39;s most iconic theme parks. An ideal destination for 
            a family getaway in the Costa Blanca, one of Spain&#39;s most popular tourist areas; 
            and just half an hour from Alicante!</p>
    </div>

    <div class="backimg2 display-container">
        <div class="display-middle no-opacity">
            <asp:LinkButton runat="server" CssClass="center button padding-medium xxlarge wide button-slice" text="ZONES"></asp:LinkButton>
        </div>
    </div>

    <div class="slider-container padding-64 margin-32">
        <p class="center xlarge text-orange margin-bottom-large bold uppercase">Our park is distributed in 5 zones, one for each continent. Find them out!</p>
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

    <div class="backimg1 display-container">
        <div class="display-middle front">
            <asp:LinkButton runat="server" CssClass="center button padding-medium button-slice xxlarge wide" text="RIDES"></asp:LinkButton>
        </div>
    </div>

    <div class="content container padding-64 margin-32 no-overflow">
        <p class="center xlarge text-orange bold margin-bottom uppercase">Enjoy our best rides:</p>
        <p class="center medium text-darkblue margin-bottom-large">Drag the images around</p>
        <div class="row-padding center">
            <div class="col quarter image-appear1 draggable">
                <div class="shadow" style="transform: rotate(10deg); z-index: -1;">
                    <asp:Image ID="Image1" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Africa/AfricanCobra.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">African Cobra</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear3 draggable">
                <div class="shadow" style="transform: rotate(-3deg)">
                    <asp:Image ID="Image2" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/America/AmericanLasVegas.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">American Las Vegas</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear2 draggable">
                <div class="shadow" style="transform: rotate(9deg)">
                    <asp:Image ID="Image3" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Asia/AsianCars.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">Asian Cars</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear4 draggable" style="transform: rotate(1deg)">
                <div class="shadow">
                    <asp:Image ID="Image7" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Europe/EuropeanCastle.jpeg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">European Castle</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-padding center">
            <div class="col quarter image-appear3 draggable">
                <div class="shadow" style="transform: rotate(-5deg);">
                    <asp:Image ID="Image4" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Asia/AsianCars.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">Asian Cars</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear2 draggable">
                <div class="shadow" style="transform: rotate(2deg);">
                    <asp:Image ID="Image5" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Oceania/OceanianTurtleaux.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">Oceanian Turtleaux</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear4 draggable">
                <div class="shadow" style="transform: rotate(-1deg);">
                    <asp:Image ID="Image6" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/America/AmericanNiagaraFalls.jpeg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">American Niagara Falls</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear1 draggable">
                <div class="shadow" style="transform: rotate(6deg);">
                    <asp:Image ID="Image8" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Africa/AfricanDinosaur.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">African Dinosaur</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="backimg3 display-container">
        <div class="display-middle">
            <asp:LinkButton runat="server" CssClass="center button padding-medium button-slice xxlarge wide" text="SHOP"></asp:LinkButton>
        </div>
    </div>
    <div class="backimg4 display-container">
        <div class="display-middle">
            <asp:LinkButton runat="server" CssClass="center button padding-medium button-slice xxlarge wide" text="HOTELS"></asp:LinkButton>
        </div>
    </div>

</asp:Content>