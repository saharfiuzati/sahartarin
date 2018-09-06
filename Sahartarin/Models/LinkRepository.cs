using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sahartarin.Models
{
    public class LinkRepository
    {
        private sahartarinDBO dbo = new sahartarinDBO();

        public IQueryable<Link> GetAllLink()
        {
            return dbo.Links;
        }
        public Link GetLink(int id)
        {
            return dbo.Links.SingleOrDefault(d => d.ID == id);
        }
        public bool IsHostedBy(int id,Link lnk)
        {
            if (lnk.UserID == id)
                return true;
            else
                return false;
        }
        public IQueryable<Link> GetLinksByCategory(int id)
        {
                var lnks=    from lnk in dbo.Links
                            where lnk.CategoryID==id
                            orderby lnk.CategoryID
                            select lnk;
                return lnks;
        }
        public IQueryable<Link> GetLinksByUser(int  id)
        {
           
            var link = dbo.Links.Include("Users.UserID").OrderBy(c => c.UserID == id);
            return link;
        }
        public void Add(Link link)
        {
            dbo.Links.AddObject(link);
        }
        public void Delete(Link link)
        {
            dbo.DeleteObject(link);
        }
        public void Save()
        {
            dbo.SaveChanges();
        }

    }
}