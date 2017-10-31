using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using ManTechTest.Models;

namespace ManTechTest.Models
{

    public class MyRoleProvider : RoleProvider
    {
        ManTechTestEntities db = new ManTechTestEntities();
        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string username)
        {
            var obj = db.Users.Where(x => x.UserName == username).SingleOrDefault();
            if (obj != null)
            {
                string rol = obj.Role.Role1;
                string[] rolary = { rol };
                return rolary;
            }
            else
            {
                throw new NotImplementedException();
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}