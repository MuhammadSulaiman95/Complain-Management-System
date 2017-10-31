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
    public class ComplaintsTypesController : Controller
    {
        private ManTechTestEntities db = new ManTechTestEntities();

        // GET: ComplaintsTypes
        public ActionResult Index()
        {
            var complaintsTypes = db.ComplaintsTypes.Include(c => c.Priority).Include(c => c.ComplaintsCategory);
            return View(complaintsTypes.ToList());
        }

        // GET: ComplaintsTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ComplaintsType complaintsType = db.ComplaintsTypes.Find(id);
            if (complaintsType == null)
            {
                return HttpNotFound();
            }
            return View(complaintsType);
        }

        // GET: ComplaintsTypes/Create
        public ActionResult Create()
        {
            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Priority1");
            ViewBag.ComplainCategoryId = new SelectList(db.ComplaintsCategories, "ComplainCategoryId", "ComplainCategory");
            return View();
        }

        // POST: ComplaintsTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ComplainTypeId,ComplainType,ComplainCategoryId,PriorityId")] ComplaintsType complaintsType)
        {
            if (ModelState.IsValid)
            {
                db.ComplaintsTypes.Add(complaintsType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Priority1", complaintsType.PriorityId);
            ViewBag.ComplainCategoryId = new SelectList(db.ComplaintsCategories, "ComplainCategoryId", "ComplainCategory", complaintsType.ComplainCategoryId);
            return View(complaintsType);
        }

        // GET: ComplaintsTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ComplaintsType complaintsType = db.ComplaintsTypes.Find(id);
            if (complaintsType == null)
            {
                return HttpNotFound();
            }
            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Priority1", complaintsType.PriorityId);
            ViewBag.ComplainCategoryId = new SelectList(db.ComplaintsCategories, "ComplainCategoryId", "ComplainCategory", complaintsType.ComplainCategoryId);
            return View(complaintsType);
        }

        // POST: ComplaintsTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ComplainTypeId,ComplainType,ComplainCategoryId,PriorityId")] ComplaintsType complaintsType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(complaintsType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Priority1", complaintsType.PriorityId);
            ViewBag.ComplainCategoryId = new SelectList(db.ComplaintsCategories, "ComplainCategoryId", "ComplainCategory", complaintsType.ComplainCategoryId);
            return View(complaintsType);
        }

        // GET: ComplaintsTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ComplaintsType complaintsType = db.ComplaintsTypes.Find(id);
            if (complaintsType == null)
            {
                return HttpNotFound();
            }
            return View(complaintsType);
        }

        // POST: ComplaintsTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ComplaintsType complaintsType = db.ComplaintsTypes.Find(id);
            db.ComplaintsTypes.Remove(complaintsType);
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
