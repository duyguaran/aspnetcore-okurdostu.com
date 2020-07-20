﻿using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Okurdostu.Data;
using Okurdostu.Data.Model;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Okurdostu.Web
{
    public class BaseController<T> : Controller where T : BaseController<T>
    {
        private ILogger<T> _logger;
        protected ILogger<T> Logger => _logger ??= HttpContext.RequestServices.GetService<ILogger<T>>();
        public OkurdostuContext Context => (OkurdostuContext)HttpContext?.RequestServices.GetService(typeof(OkurdostuContext));


        public string[] blockedUsernames = {
            "","comment","account","confirmemail","girisyap","kaydol","ihtiyaclar","beta","arama",
            "gizlilik-politikasi","kullanici-sozlesmesi","sss","kvkk",
            "home", "like","logout", "ihtiyac-olustur","ihtiyac", "universiteler"
        };
        public async Task SignInWithCookie(User user)
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            var ClaimList = new List<Claim>
            {
                new Claim("Id", user.Id.ToString()),
                new Claim("Username", user.Username),
                new Claim("Email", user.Email),
                new Claim("EmailConfirmStatus", user.IsEmailConfirmed.ToString()),
                new Claim("LastChangedOn", user.LastChangedOn.ToString()),
            };
            if (user.PictureUrl != null)
            {
                ClaimList.Add(new Claim("Photo", user.PictureUrl));
            }

            var ClaimsIdentity = new ClaimsIdentity(ClaimList, CookieAuthenticationDefaults.AuthenticationScheme);
            var AuthProperties = new AuthenticationProperties
            {
                AllowRefresh = true,
                IsPersistent = true
            };
            await HttpContext.SignInAsync(
                CookieAuthenticationDefaults.AuthenticationScheme,
                new ClaimsPrincipal(ClaimsIdentity),
                AuthProperties);
        }

        public async Task SyncAuthenticatedUser(string LastChangedOnFromDB, User AuthenticatedUser)
        {
            if (LastChangedOnFromDB != User.Identity.GetLastChangedOn())
            {
                await SignInWithCookie(AuthenticatedUser);
            }
        }

        public async Task<User> GetAuthenticatedUserFromDatabaseAsync()
        {
            var authUserId = User?.Identity?.GetUserId();
            if (authUserId != null)
            {
                var AuthenticatedUser = await Context.User.FirstOrDefaultAsync(x => x.Id == long.Parse(authUserId) && x.IsActive);
                SyncAuthenticatedUser(AuthenticatedUser.LastChangedOn.ToString(), AuthenticatedUser);
                return AuthenticatedUser ?? null;
            }
            else
            {
                return null;
            }
        }
    }
}
