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
        public int reports { get; set; }

        public Review(string cod, string description, int score, string hotel, string name = "Unknown", int reports = 0)
        {
            this.cod = CAD.CADReview.NextCode();
            this.name = name;
            this.score = score;
            this.description = description;
            this.hotel = hotel;
            this.reports = reports;
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
            reports = p.reports;
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

        public static DataSet ListAllReviews()
        {
            CAD.CADReview c = new CAD.CADReview();
            DataSet reviews = c.ListAllReviews();
            return reviews;
        }

        public static bool Reported()
        {
            CAD.CADReview c = new CAD.CADReview();
            return c.Reported();
        }

        public static void Report(String cod)
        {
            CAD.CADReview c = new CAD.CADReview();
            c.Report(cod);
        }

        public DataSet DeleteReview(int i)
        {
            CAD.CADReview c = new CAD.CADReview();
            DataSet a = c.DeleteReview(this, i);
            return a;
        }

        public static List<Review> ListReviewsName(String hotel)
        {
            CAD.CADReview c = new CAD.CADReview();
            List<Review> reviews = c.ListReviewsName(hotel);
            return reviews;
        }
    }
}

