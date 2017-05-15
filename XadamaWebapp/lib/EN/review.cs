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
        public string cod { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public int score { get; set; }
        public string hotel { get; set; }

        public Review(string cod, string description, int score, string hotel, string name = "Unknown")
        {
            this.cod = CAD.CADReview.NextCode();
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

