﻿using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Newtonsoft.Json;

namespace Okurdostu.Web.Extensions
{
    public static class TempDataExtensions
    {
        public static void Set<T>(this ITempDataDictionary tempData, string key, T value)
        {
            string json = JsonConvert.SerializeObject(value);
            tempData.Remove(key);
            tempData.Add(key, json);
        }

        public static T Get<T>(this ITempDataDictionary tempData, string key)
        {
            if (!tempData.ContainsKey(key))
            {
                return default;
            }

            return !(tempData[key] is string value) ? default : JsonConvert.DeserializeObject<T>(value);
        }
    }
}
