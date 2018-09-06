using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.ComponentModel.DataAnnotations;
using Sahartarin.Models;
using System.Text.RegularExpressions;
using System.Data;
namespace Sahartarin.Models
{
    [System.Web.Mvc.Bind(Include = "Title,Description,SendingTime")]
    [MetadataType(typeof(Link_Validation))]
    public partial class Link
    {
        sahartarinDBO dbo = new sahartarinDBO();
        public bool IsValid
        {
            get { return (GetRuleViolations().Count() == 0); }
        }
        public void OnValidate(ChangeAction action)
        {
            if (!IsValid)
                throw new ApplicationException("Rule violations prevent saving");
        } 
        public IEnumerable<RuleViolation> GetRuleViolations()
        {
            if (String.IsNullOrEmpty(Title))
                yield return new RuleViolation("Title required", "Title");

            if (String.IsNullOrEmpty(Description))
                yield return new RuleViolation("Description required", "Description");

            if (String.IsNullOrEmpty(URL))
                yield return new RuleViolation("URL required", "URL");
            if (String.IsNullOrEmpty(CategoryID.ToString()))
                yield return new RuleViolation("Category required", "Category"); 
            yield break; 
        }

        public class Link_Validation
        {

            [System.Web.Mvc.HiddenInput(DisplayValue = false)]
            public int ID { get; set; }

            [Required(ErrorMessage = "Title is required")]
            [StringLength(50, ErrorMessage = "Title may not be longer than 50 characters")]
            public string Title { get; set; }

            [Required(ErrorMessage = "Description is required")]
            [StringLength(265, ErrorMessage = "Description may not be longer than 1024 characters")]
            public string Description { get; set; }

            public string UserID { get; set; }
        }
       

        public bool IsUserRegistered(string userName)
        {
            return dbo.Users.Any(r => r.UserName == userName);
        }
    }
    
}