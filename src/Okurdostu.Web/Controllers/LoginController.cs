﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Okurdostu.Data.Model;
using Okurdostu.Web.Extensions;
using Okurdostu.Web.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Okurdostu.Web.Controllers
{
    public class LoginController : BaseController<LoginController>
    {
        [Route("Girisyap")]
        public IActionResult Index()
        {
            return HttpContext.User.Identity.IsAuthenticated ? (IActionResult)Redirect("/") : View();
        }

        [HttpPost, ValidateAntiForgeryToken]
        [Route("Girisyap")]
        public async Task<IActionResult> Index(LoginModel Model, string ReturnUrl)
        {
            if (HttpContext.User.Identity.IsAuthenticated)
            {
                return Redirect("/");
            }

            var User = await AuthenticateAsync(Model);
            if (User != null)
            {
                await SignInWithCookie(User);

                Logger.LogInformation(User.Username + " logged in at " + DateTime.Now);

                return string.IsNullOrEmpty(ReturnUrl) ? Redirect("/beta") : Redirect(ReturnUrl);
            }
            TempData["LoginMessage"] = "Kullanıcı adınız veya parolanız geçersiz";
            return View();
        }

        [NonAction]
        public async Task<User> AuthenticateAsync(LoginModel Model)
        {
            var User = await Context.User.Where(x => x.Username == Model.Username || x.Telephone == Model.Username || x.Email == Model.Username).FirstOrDefaultAsync();
            //modelden username olarak aldığımız input, aslında Username,Telephone veya Email ile eş olabilir bunlardan her hangi birine uyuyorsa User'i seçip
            //ardından passwordunu kontrol ediyor
            return User != null && User.Password == Model.Password.SHA512() ? User : null;
        }
    }
}
