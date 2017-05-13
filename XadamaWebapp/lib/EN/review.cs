using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Review
    {
        public String cod { get; set; }
        public String name { get; set; }
        public String description { get; set; }
        public int score { get; set; }
        public String hotel { get; set; }

        public Review(String cod, int score, String description, String hotel, String name = "Unknown")
        {
            this.cod = (Int32.Parse(cod) + CAD.CADReview.MaxCode(hotel) + 1).ToString();
            this.name = name;
            this.score = score;
            this.description = description;
            this.hotel = hotel;
        }

        public void Create()
        {
            CAD.CADReview c = new CAD.CADReview();
            c.Create(this);
        }

        public void Read()
        {
            CAD.CADReview c = new CAD.CADReview();
            Review p = (Review)c.Read(cod);
            cod = p.cod;
            name = p.name;
            score = p.score;
            description = p.description;
            hotel = p.hotel;
        }

        public void Update()
        {
            CAD.CADReview c = new CAD.CADReview();
            c.Update(this);
        }

        public void Delete()
        {
            CAD.CADReview c = new CAD.CADReview();
            c.Delete(cod);
        }

        public static DataSet ListReviews(String hotel)
        {
            CAD.CADReview c = new CAD.CADReview();
            DataSet reviews = c.ListReviews(hotel);
            return reviews;
        }

    }
}

