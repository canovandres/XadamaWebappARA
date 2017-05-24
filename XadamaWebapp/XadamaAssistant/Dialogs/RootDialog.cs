using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.Bot.Builder.Dialogs;
using Microsoft.Bot.Builder.FormFlow;
using Microsoft.Bot.Builder.Luis;
using Microsoft.Bot.Builder.Luis.Models;
using Microsoft.Bot.Connector;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;
using System.Globalization;
using System.Security.Policy;
using lib.EN;

namespace XadamaAssistant.Dialogs
{
    [Serializable]

    [LuisModel("15daf9c6-0fef-40f8-8e5e-20ad95855d22", "1fda1d9d4a20401f99492e5fedfab865")]
    public class RootDialog : LuisDialog<object>
    {
        [LuisIntent("")]
        [LuisIntent("None")]
        public async Task None(IDialogContext context, LuisResult result)
        {
            string message = $"Sorry, I did not understand '{result.Query}'. Type 'help me' if you need assistance.";

            await context.PostAsync(message);

            context.Wait(this.MessageReceived);
        }

        [LuisIntent("Education.Hi")]
        public async Task Hi(IDialogContext context, LuisResult result)
        {
            await context.PostAsync("Hi!");

            context.Wait(this.MessageReceived);
        }

        [LuisIntent("Education.Thx")]
        public async Task Thx(IDialogContext context, LuisResult result)
        {
            await context.PostAsync("You're welcome!");

            context.Wait(this.MessageReceived);
        }

        [LuisIntent("Education.Bye")]
        public async Task Bye(IDialogContext context, LuisResult result)
        {
            await context.PostAsync("Good bye!");

            context.Wait(this.MessageReceived);
        }

        [LuisIntent("Utilities.Help")]
        public async Task Help(IDialogContext context, LuisResult result)
        {
            string message = @"You can try to say things like: 
                                    'Show me information about African Cobra', 
                                    'Show me reviews of European Palace', ...";

            await context.PostAsync(message);

            context.Wait(this.MessageReceived);
        }

        [LuisIntent("GetInfo.Ride")]
        public async Task InfoRide(IDialogContext context, LuisResult result)
        {
            EntityRecommendation rideEntityRecommendation;

            if (result.TryFindEntity("ride", out rideEntityRecommendation))
            {
                Ride ride = new Ride("", "", "");
                ride.ReadName(rideEntityRecommendation.Entity);

                if (ride.name == "")
                {
                    string message = @"Sorry, I can't find this ride";

                    await context.PostAsync(message);
                }
                else
                {

                    TextInfo myTI = new CultureInfo("en-US", false).TextInfo;
                    await context.PostAsync($"Looking for information about '{myTI.ToTitleCase(rideEntityRecommendation.Entity)}'...");

                    var resultMessage = context.MakeMessage();
                    resultMessage.AttachmentLayout = AttachmentLayoutTypes.List;
                    resultMessage.Attachments = new List<Attachment>();

                    string strCurrentURL = HttpContext.Current.Request.Url.ToString().Replace(@"api/messages", ""); ;
                    int length = ride.image.Length - 3;
                    string strImage = String.Format(@"{0}/{1}", strCurrentURL, ride.image.Substring(2, length));

                    ThumbnailCard thumbnailCard = new ThumbnailCard()
                    {
                        Title = ride.name,
                        Subtitle = "Zone: " + ride.zone,
                        Text = ride.description,
                        Images = new List<CardImage>()
                    {
                        new CardImage(url: strImage)
                    },
                    };

                    resultMessage.Attachments.Add(thumbnailCard.ToAttachment());
                    await context.PostAsync(resultMessage);
                }

            }

            context.Wait(this.MessageReceived);
        }

        [LuisIntent("ShowHotelsReviews")]
        public async Task Reviews(IDialogContext context, LuisResult result)
        {
            EntityRecommendation hotelEntityRecommendation;

            if (result.TryFindEntity("hotel", out hotelEntityRecommendation))
            {
                Review review = new Review("", "", 0, "");

                List <Review> reviews = Review.ListReviewsName(hotelEntityRecommendation.Entity);

                await context.PostAsync($"Looking for reviws of '{hotelEntityRecommendation.Entity}'...");

                if (reviews.Count == 0)
                {
                    string message = @"Sorry, I can't find reviews for this hotel";

                    await context.PostAsync(message);
                }
                else
                {
                    var resultMessage = context.MakeMessage();
                    resultMessage.AttachmentLayout = AttachmentLayoutTypes.Carousel;
                    resultMessage.Attachments = new List<Attachment>();

                    for (int i = 0; i < reviews.Count; i++)
                    {
                        ThumbnailCard thumbnailCard = new ThumbnailCard()
                        {
                            Title = reviews[i].name,
                            Subtitle = "Mark: " + reviews[i].score,
                            Text = reviews[i].description
                        };

                        resultMessage.Attachments.Add(thumbnailCard.ToAttachment());
                    }

                    await context.PostAsync(resultMessage);
                }
            }
            else
            {
                string message = @"Sorry, I can't find this hotel";

                await context.PostAsync(message);
            }

            context.Wait(this.MessageReceived);
        }

        /*[LuisIntent("Book.Restaurant")]
        public async Task BookRestaurant(IDialogContext context, LuisResult result)
        {
            EntityRecommendation rideEntityRecommendation;

            if (result.TryFindEntity("restaurant", out rideEntityRecommendation))
            {

            }

            context.Wait(this.MessageReceived);
        }*/
    }
}