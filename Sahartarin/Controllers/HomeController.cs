using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Sahartarin.Models;
namespace Sahartarin.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        CategoryRepository categoryrepository = new CategoryRepository();
        LinkRepository linkrepository = new LinkRepository();
        TagRepository tg = new TagRepository();
        Tag tag = new Tag();
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {

            return View();
        }
        public ActionResult ShowCategory()
        {
            
            var cat = categoryrepository.ShowAllCategory().ToList();
            return View("ShowCategory", cat);
        }


        public ActionResult Links(int id,int? page)
        {
            const int pageSize = 10;
            var links = linkrepository.GetLinksByCategory(id).ToList();
            var PageIndex = links.Skip((page ?? 0) * pageSize)
                                          .Take(pageSize).ToList();
            return View("Links", PageIndex);
        }
        public ActionResult Details(int id)
        {
            Link lnk = linkrepository.GetLink(id);
            if (lnk == null)
                return View("NotFound");
            else
                return View("Details", lnk);
        }
        [Authorize]
        public ActionResult SetLink()
        {
            IQueryable<Category> cat = categoryrepository.ShowAllCategory();
            var selectList = new SelectList(cat, "ID", "CategoryName");
            ViewData["CategoryList"] = selectList;
            return View();
        }
      
        [HttpPost, Authorize]
        public void SetLink(Link lnk)
        {
          
           
            tag.TagName=Request.Form["TagName"];
            
            UserRepository us=new UserRepository();
            IQueryable<Category> cat = categoryrepository.ShowAllCategory();
            var selectList = new SelectList(cat, "ID", "CategoryName");
            ViewData["CategoryList"] = selectList;
            if (ModelState.IsValid)
            {
                lnk.CategoryID = Convert.ToInt32(Request.Form["CategoryID"]);
                lnk.SendingTime = DateTime.Now;
                lnk.UserID =us.GetUserID(User.Identity.Name.ToString());
                lnk.URL ="www.google.com";
                linkrepository.Add(lnk);
                linkrepository.Save();
                if (tg.Exist(tag.TagName))
                    tg.AddCurrentTag(tag.TagName, lnk);
                    
                else
                    tg.Add(tag, lnk);
                tg.Save();
                
               // return RedirectToAction("Links", new { id = lnk.CategoryID });
            }
          //  return View();
        }
        
       [Authorize]
        public ActionResult EditLink(int id)
        {
            Link lnk = linkrepository.GetLink(id);
            UserRepository us = new UserRepository();
            int userid = us.GetUserID(User.Identity.Name.ToString());
            IQueryable<Category> cat = categoryrepository.ShowAllCategory();
            var selectList = new SelectList(cat, "ID", "CategoryName");
           
            ViewData["CategoryList"] = selectList;
            if (!linkrepository.IsHostedBy(userid, lnk))
                return View("InvalidOwner");
           else
            return View(lnk);
        }
       [HttpPost, Authorize]
       public ActionResult EditLink(int id, FormCollection collestion)
       {
           Link lnk = linkrepository.GetLink(id);
           UserRepository us = new UserRepository();
           int userid = us.GetUserID(User.Identity.Name.ToString());
           if (!linkrepository.IsHostedBy(userid, lnk))
               return View("InvalidOwner");
           
           try
           {
              
               lnk.CategoryID = Convert.ToInt32(Request.Form["CategoryID"]);
               lnk.SendingTime = DateTime.Now;
               lnk.Title = Request.Form["Title"];
               lnk.Description = Request.Form["Description"];
               lnk.URL = Request.Form["URL"];
             
               
               UpdateModel(lnk);
               linkrepository.Save();
               return RedirectToAction("Details", new { id = lnk.ID });
           }
           catch
           {
               foreach (var issue in lnk.GetRuleViolations())
               {
                   ModelState.AddModelError(issue.PropertyName, issue.ErrorMessage);


                   IQueryable<Category> cat = categoryrepository.ShowAllCategory();
                   var selectList = new SelectList(cat, "ID", "CategoryName");
                   ViewData["CategoryList"] = selectList;

               }
               return View(lnk);
           }
       } 
        [Authorize]
        public ActionResult DeleteLink(int id)
        {
            Link lnk = linkrepository.GetLink(id);
            UserRepository us = new UserRepository();
            int userid = us.GetUserID(User.Identity.Name.ToString());
            if (!linkrepository.IsHostedBy(userid, lnk))
                return View("InvalidOwner");
            if (lnk == null)
                return View("NotFound");
            else
                return View("DeleteLink", lnk);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteLink(int id, string confirmButton)
        {
            Link lnk = linkrepository.GetLink(id);
            UserRepository us = new UserRepository();
            int userid = us.GetUserID(User.Identity.Name.ToString());
            if (!linkrepository.IsHostedBy(userid, lnk))
                return View("InvalidOwner");
            if (lnk == null)
                return View("NotFound");
            linkrepository.Delete(lnk);
            linkrepository.Save();
            return View("Deleted");
        }
    }
}
