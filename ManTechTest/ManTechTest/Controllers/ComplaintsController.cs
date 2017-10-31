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
    [Authorize]
    public class ComplaintsController : Controller
    {
        private ManTechTestEntities db = new ManTechTestEntities();

        // GET: Complaints
        
        public ActionResult Index()
        {
            var complaints = db.Complaints.Include(c => c.ComplaintsCategory).Include(c => c.ComplaintsType).Include(c => c.Department).Include(c => c.Employee);
            return View(complaints.ToList());
        }

        // GET: Complaints/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Complaint complaint = db.Complaints.Find(id);
            if (complaint == null)
            {
                return HttpNotFound();
            }
            return View(complaint);
        }

        // GET: Complaints/Create
        public ActionResult Create()
        {
            ViewBag.ComplainCategoryId = new SelectList(db.ComplaintsCategories, "ComplainCategoryId", "ComplainCategory");
            //ViewBag.ComplainTypeId = new SelectList(db.ComplaintsTypes, "ComplainTypeId", "ComplainType");
            ViewBag.DepartmentId = new SelectList(db.Departments, "DepartmentId", "DepartmentName");
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "EmployeeName");
            return View();
        }
        public JsonResult getComplainType(int ComplainCategoryId)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<ComplaintsType> complaintype = db.ComplaintsTypes.Where(x => x.ComplainCategoryId == ComplainCategoryId).ToList();
            return Json(complaintype, JsonRequestBehavior.AllowGet);
        }

        // POST: Complaints/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ComplainId,ComplainCategoryId,ComplainTypeId,ComplainTitle,ComplainDetail,ComplainAttachment,ComplainDate,EmployeeId,DepartmentId")] Complaint complaint)
        {
            if (ModelState.IsValid)
            {
                complaint.ComplainDate = DateTime.Parse(DateTime.Now.ToString());
                complaint.EmployeeId = (int) Session["empId"];
                var rd = from dep in db.Employees
                             where dep.EmployeeId == complaint.EmployeeId
                             select dep.DeparmentId;
                var getDep = rd.SingleOrDefault();
                complaint.DepartmentId = getDep;
                db.Complaints.Add(complaint);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ComplainCategoryId = new SelectList(db.ComplaintsCategories, "ComplainCategoryId", "ComplainCategory", complaint.ComplainCategoryId);
            ViewBag.ComplainTypeId = new SelectList(db.ComplaintsTypes, "ComplainTypeId", "ComplainType", complaint.ComplainTypeId);
            ViewBag.DepartmentId = new SelectList(db.Departments, "DepartmentId", "DepartmentName", complaint.DepartmentId);
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "EmployeeName", complaint.EmployeeId);
            return View(complaint);
        }

        // GET: Complaints/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Complaint complaint = db.Complaints.Find(id);
            if (complaint == null)
            {
                return HttpNotFound();
            }
            ViewBag.ComplainCategoryId = new SelectList(db.ComplaintsCategories, "ComplainCategoryId", "ComplainCategory", complaint.ComplainCategoryId);
            ViewBag.ComplainTypeId = new SelectList(db.ComplaintsTypes, "ComplainTypeId", "ComplainType", complaint.ComplainTypeId);
            ViewBag.DepartmentId = new SelectList(db.Departments, "DepartmentId", "DepartmentName", complaint.DepartmentId);
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "EmployeeName", complaint.EmployeeId);
            return View(complaint);
        }

        // POST: Complaints/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ComplainId,ComplainCategoryId,ComplainTypeId,ComplainTitle,ComplainDetail,ComplainAttachment,ComplainDate,EmployeeId,DepartmentId")] Complaint complaint)
        {
            if (ModelState.IsValid)
            {
                db.Entry(complaint).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ComplainCategoryId = new SelectList(db.ComplaintsCategories, "ComplainCategoryId", "ComplainCategory", complaint.ComplainCategoryId);
            ViewBag.ComplainTypeId = new SelectList(db.ComplaintsTypes, "ComplainTypeId", "ComplainType", complaint.ComplainTypeId);
            ViewBag.DepartmentId = new SelectList(db.Departments, "DepartmentId", "DepartmentName", complaint.DepartmentId);
            ViewBag.EmployeeId = new SelectList(db.Employees, "EmployeeId", "EmployeeName", complaint.EmployeeId);
            return View(complaint);
        }

        // GET: Complaints/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Complaint complaint = db.Complaints.Find(id);
            if (complaint == null)
            {
                return HttpNotFound();
            }
            return View(complaint);
        }

        // POST: Complaints/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Complaint complaint = db.Complaints.Find(id);
            db.Complaints.Remove(complaint);
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
