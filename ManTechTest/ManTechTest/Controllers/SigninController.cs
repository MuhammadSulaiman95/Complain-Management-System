using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ManTechTest.Models;

namespace ManTechTest.Controllers
{
    public class SigninController : Controller
    {
        ManTechTestEntities db = new ManTechTestEntities();

        // GET: Signin
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(User uData)
        {
            var chk = db.Users.Where(x => x.UserName == uData.UserName && x.Password == uData.Password).SingleOrDefault();
            if (chk != null)
            {
                FormsAuthentication.SetAuthCookie(uData.UserName, false);
                var rq = from us in db.Users
                         where us.UserName == uData.UserName
                         select us.RoleId;
                var getRid = rq.SingleOrDefault();
                if (getRid==1)
                {
                    Session["empName"] = uData.UserName;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    var emp = db.Employees.Where(e => e.Email == uData.UserName).SingleOrDefault();
                    Session["empId"] = emp.EmployeeId;
                    Session["empName"] = emp.EmployeeName;
                    Session["designation"] = emp.Designation;
                    return RedirectToAction("Index", "Home");
                }
            }
            else
            {
                return View();
            }
        }

        public ActionResult Signout()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            return RedirectToAction("Index", "Signin");
        }
    }
}