﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;


namespace Okurdostu.Web.Controllers
{
    public class ProfileController : BaseController<ProfileController>
    {
        public async Task<IActionResult> Index(string username)
        {
            if (!string.IsNullOrEmpty(username))
            {
                var _User = await Context.User.
                    Include(user => user.UserEducation).
                    ThenInclude(x => x.University).
                    FirstOrDefaultAsync(x => x.Username == username && x.IsActive);

                if (_User != null) return View(_User);
            }

            return NotFound();
        }

    }
}
