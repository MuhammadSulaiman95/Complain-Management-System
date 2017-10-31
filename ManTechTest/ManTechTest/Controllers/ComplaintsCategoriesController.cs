using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ManTechTest.Models;

namespace ManTechTest.Controllers
{
    public class ComplaintsCategoriesController : Controller
    {
        private ManTechTestEntities db = new ManTechTestEntities();

        // GET: ComplaintsCategories
        public ActionResult Index()
        {
            return View(db.ComplaintsCategories.ToList());
        }

        // GET: ComplaintsCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ComplaintsCategory complaintsCategory = db.ComplaintsCategories.Find(id);
            if (complaintsCategory == null)
            {
                return HttpNotFound();
            }
            return View(complaintsCategory);
        }

        // GET: ComplaintsCategories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ComplaintsCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ComplainCategoryId,ComplainCategory,PriorityId")] ComplaintsCategory complaintsCategory)
        {
            if (ModelState.IsValid)
            {
                db.ComplaintsCategories.Add(complaintsCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(complaintsCategory);
        }

        // GET: ComplaintsCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ComplaintsCategory complaintsCategory = db.ComplaintsCategories.Find(id);
            if (complaintsCategory == null)
            {
                return HttpNotFound();
            }
            return View(complaintsCategory);
        }

        // POST: ComplaintsCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ComplainCategoryId,ComplainCategory,PriorityId")] ComplaintsCategory complaintsCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(complaintsCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(complaintsCategory);
        }

        // GET: ComplaintsCategories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ComplaintsCategory complaintsCategory = db.ComplaintsCategories.Find(id);
            if (complaintsCategory == null)
            {
                return HttpNotFound();
            }
            return View(complaintsCategory);
        }

        // POST: ComplaintsCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ComplaintsCategory complaintsCategory = db.ComplaintsCategories.Find(id);
            db.ComplaintsCategories.Remove(complaintsCategory);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
