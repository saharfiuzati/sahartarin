using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sahartarin.Models
{
    public class UserRepository
    {
        private sahartarinDBO dbo = new sahartarinDBO();

        public IQueryable<User> GetAllLink()
        {
            return dbo.Users;
        }
        public User GetUser(int id)
        {
            return dbo.Users.SingleOrDefault(d => d.ID == id);
        }
        public int GetUserID(string _Name)
        {
            var userid = from usr in dbo.Users
                         where usr.UserName == _Name
                         select usr.ID;
            return userid.SingleOrDefault();
        }
        public IQueryable<Link> GetLinksByUser(int id)
        {
            var link = dbo.Links.Include("Users.UserID").OrderBy(c => c.UserID == id);
            return link;
        }
        public void Add(User user)
        {
            dbo.Users.AddObject(user);
        }
        public void Delete(User user)
        {
            dbo.DeleteObject(user);
        }
        public void Save()
        {
            dbo.SaveChanges();
        }
        public int NewUser(string _Name,string _Country,string _WebSite)
        {
            dbo.Users.AddObject(
                new User
                {
                    UserName = _Name,
                    Country=_Country,
                    WebSite=_WebSite
                    
                });

            dbo.SaveChanges();

            return 0;
        }

    }
}