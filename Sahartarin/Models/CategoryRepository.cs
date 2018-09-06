using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sahartarin.Models;
using System.Web.Mvc;
using System.Collections;
namespace Sahartarin.Models
{
    public class CategoryRepository
    {
        private sahartarinDBO dbo = new sahartarinDBO();
        public IQueryable<Category> ShowAllCategory()
        {
            return dbo.Categories;
        }
        public Category GetCategory(int id)
        {
            return dbo.Categories.SingleOrDefault(d => d.ID == id);
        }
        public void Add(Category category)
        {
            dbo.Categories.AddObject(category);
        }
        public void Delete(Category category)
        {
            dbo.Categories.DeleteObject(category);
        }
        public void Save()
        {
            dbo.SaveChanges();
        }
    }
}