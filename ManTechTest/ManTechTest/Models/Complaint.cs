//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ManTechTest.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Complaint
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Complaint()
        {
            this.Tasks = new HashSet<Task>();
        }
    
        public int ComplainId { get; set; }
        public Nullable<int> ComplainCategoryId { get; set; }
        public Nullable<int> ComplainTypeId { get; set; }
        public string ComplainTitle { get; set; }
        public string ComplainDetail { get; set; }
        public byte[] ComplainAttachment { get; set; }
        public Nullable<System.DateTime> ComplainDate { get; set; }
        public Nullable<int> EmployeeId { get; set; }
        public Nullable<int> DepartmentId { get; set; }
    
        public virtual ComplaintsCategory ComplaintsCategory { get; set; }
        public virtual ComplaintsType ComplaintsType { get; set; }
        public virtual Department Department { get; set; }
        public virtual Employee Employee { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Task> Tasks { get; set; }
    }
}