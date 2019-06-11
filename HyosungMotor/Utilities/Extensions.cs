﻿using Microsoft.Owin.Security;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;

namespace HyosungMotor.Utilities
{
    public static class Extensions
    {
        public static void AddUpdateClaim(this IPrincipal currentPrincipal, string key, string value)
        {
            var identity = currentPrincipal.Identity as ClaimsIdentity;
            if (identity == null)
                return;

            // check for existing claim and remove it
            var existingClaim = identity.FindFirst(key);
            if (existingClaim != null)
                identity.RemoveClaim(existingClaim);

            // add new claim
            identity.AddClaim(new Claim(key, value));
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.AuthenticationResponseGrant = new AuthenticationResponseGrant(new ClaimsPrincipal(identity), new AuthenticationProperties() { IsPersistent = true });
        }

        public static string GetClaimValue(this IPrincipal currentPrincipal, string key)
        {
            var identity = currentPrincipal.Identity as ClaimsIdentity;
            if (identity == null)
                return null;

            // check for existing claim
            var existingClaim = identity.FindFirst(key);
            if (existingClaim != null)
                return identity.Claims.First(c => c.Type == key).Value;
            return null;
            //var claim = identity.Claims.First(c => c.Type == key);
        }
    }
}