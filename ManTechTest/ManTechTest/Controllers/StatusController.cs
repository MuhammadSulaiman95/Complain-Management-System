using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ManTechTest.Models;
using System.Net;
using System.Data.Entity;

namespace ManTechTest.Controllers
{
    public class StatusController : Controller
    {
        private ManTechTestEntities db = new ManTechTestEntities();
        // GET: Status
        public ActionResult Index()
        {
            return View(db.Statuses.ToList());
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StatusId,Status1")] Status status)
        {
            if(ModelState.IsValid)
            {
                db.Statuses.Add(status);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(status);
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Status status = db.Statuses.Find(id);
            if(status==null)
            {
                return HttpNotFound();
            }
            return View(status);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "StatusId,Status1")] Status status)
        {
            if(ModelState.IsValid)
            {
                db.Entry(status).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(status);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            Status status = db.Statuses.Find(id);
            return View(status);
        }

        [HttpPost,ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Status status = db.Statuses.Find(id);
            db.Statuses.Remove(status);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}