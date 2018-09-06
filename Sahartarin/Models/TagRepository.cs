 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sahartarin.Models
{
    public class TagRepository
    {
        sahartarinDBO dbo = new sahartarinDBO();
        public IQueryable<Tag> GetAllTag()
        {
            return dbo.Tags;
        }
        public Tag GetTag(int id)
        {
            return dbo.Tags.SingleOrDefault(d => d.ID == id);
        }
        public bool Exist(string  tagname)
        {
            foreach (Tag tag in dbo.Tags)
            {
                if (tag.TagName == tagname)
                    return true;
                
            }
            return false;
            
        }
        public Tag GetTagByName(string name)
        {
            return dbo.Tags.SingleOrDefault(d => d.TagName == name);
        }
        public void AddCurrentTag(string  tagname, Link lnk)
        {
            Tag_Link tgl = new Tag_Link();
            Tag tag=GetTagByName(tagname); 
            tgl.tagid = tag.ID;
            tgl.linkid = lnk.ID;
            dbo.Tag_Link.AddObject(tgl);
            
        }
        public void Add(Tag Tag,Link lnk)
        {
            Tag_Link tgl = new Tag_Link();
            tgl.tagid=Tag.ID;
            tgl.linkid=lnk.ID;
            dbo.Tag_Link.AddObject(tgl);
            dbo.Tags.AddObject(Tag);
        }
        public void Delete(Tag Tag)
        {
            dbo.DeleteObject(Tag);
        }
        public void Save()
        {
            dbo.SaveChanges();
        }

    }
}